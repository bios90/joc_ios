import Foundation
import UIKit

protocol BasketItemListener
{
    func clickedItem(item:Model_Added_Item)
    func clickedDelete(item:Model_Added_Item)
    func clickedMakeOrder(sum:Double)
}

class VCBasket:BaseViewContoller
{
    var backPressedListener:BackPressable?
    
    var lbl_header:MyLabel?
    var lbl_sum:MyLabel?
    var btn_make_order:BtnGreenGrad?
    var scroll_items:UIScrollView?
    var stack_items:UIStackView?
    var lblArrowBack : FawLabel?
    
    init(backPressedListener:BackPressable)
    {
        self.backPressedListener = backPressedListener
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
    }
    
    func setup()
    {
        setNeedsStatusBarAppearanceUpdate()
        
        self.view!.removeAllSubviews()
        
        let grad_view = UIView()
        self.view.addSubview(grad_view)
        grad_view.edgesToSuperview(excluding: .bottom)
        grad_view.height(40+UIDevice.current.status_bar_height)
        grad_view.make_gradient(grad_layer: Colors.getInstance.getOrangeGradient(horizontal: true))
        
        lbl_header = MyLabel()
        lbl_header!.textColor = Colors.getInstance.white
        lbl_header!.font = Fonts.getInstance.font_semi_s
        lbl_header!.textAlignment = .center
        
        lbl_header!.text = "Корзина"
        
        grad_view.addSubview(lbl_header!)
        lbl_header!.bottomToSuperview(offset:-16)
        lbl_header!.centerXToSuperview()
        lbl_header!.sizeToFit()
        
        lblArrowBack = FawArrowBack.getArrow()
        grad_view.addSubview(lblArrowBack!)
        lblArrowBack!.leftToSuperview(offset:20)
        lblArrowBack!.centerY(to: lbl_header!)
        lblArrowBack!.sizeToFit()
        
        lblArrowBack!.click =
            {
                self.backPressedListener?.backPressed()
        }
        
        
        let bottom_view = UIView()
        bottom_view.add_light_shadow()
        bottom_view.backgroundColor = Colors.getInstance.white
        self.view.addSubview(bottom_view)
        bottom_view.bottomToSuperview()
        bottom_view.leftToSuperview()
        bottom_view.rightToSuperview()
        
        let lbl_sum_title = MyLabel()
        lbl_sum_title.text = "Сумма :"
        lbl_sum_title.font = Fonts.getInstance.font_semi_xs
        lbl_sum_title.textColor = Colors.getInstance.gray4
        lbl_sum_title.textAlignment = .right
        bottom_view.addSubview(lbl_sum_title)
        lbl_sum_title.width(to: bottom_view,multiplier:0.49)
        lbl_sum_title.height(24)
        lbl_sum_title.topToSuperview(offset:12)
        lbl_sum_title.leftToSuperview()
        
        
        lbl_sum = MyLabel()
        lbl_sum!.text = " 0 "
        lbl_sum!.font = Fonts.getInstance.font_bold_xs
        lbl_sum!.textColor = Colors.getInstance.gray4
        lbl_sum?.textAlignment = .left
        bottom_view.addSubview(lbl_sum!)
        lbl_sum!.width(to: bottom_view,multiplier:0.49)
        lbl_sum!.height(24)
        lbl_sum!.topToSuperview(offset:12)
        lbl_sum!.rightToSuperview()
        
        
        btn_make_order = BtnGreenGrad()
        btn_make_order!.setTitle("Оформить", for: .normal)
        btn_make_order!.titleLabel!.font = Fonts.getInstance.font_bold_xs
        btn_make_order!.titleLabel!.textColor = Colors.getInstance.white
        btn_make_order!.layer.cornerRadius = 4
        bottom_view.addSubview(btn_make_order!)
        btn_make_order!.topToBottom(of: lbl_sum_title,offset:12)
        btn_make_order!.leftToSuperview(offset:12)
        btn_make_order!.rightToSuperview(offset:-12)
        btn_make_order!.height(36)
 
        
        var padding_bottom:CGFloat = 12
        bottom_view.resize_to_fit_vertical(padding_bottom: padding_bottom)
        
        scroll_items = UIScrollView()
        self.view.addSubview(scroll_items!)
        scroll_items!.showsVerticalScrollIndicator = false
        scroll_items!.topToBottom(of: grad_view)
        scroll_items!.bottomToTop(of: bottom_view)
        scroll_items!.leftToSuperview()
        scroll_items!.rightToSuperview()
        
        print("Will set Stack!!")
        stack_items = UIStackView()
        scroll_items!.addSubview(stack_items!)
        stack_items!.leftToSuperview()
        stack_items!.topToSuperview()
        stack_items!.axis = .vertical
        stack_items!.distribution = .fill
        stack_items!.alignment = .center
        stack_items!.spacing = 4
        stack_items!.layoutMargins = UIEdgeInsets(top: 8 , left: 8 , bottom: 8, right: 8)
        stack_items!.isLayoutMarginsRelativeArrangement = true
    }
    
    func bind_items(items:[Model_Added_Item],listener:BasketItemListener)
    {
        setup()
        for i in 0..<items.count
        {
            let item = items[i]
            
            let view_item = LaBasketItem(added_item: item,listener: listener)
            view_item.width(self.view.frame.width-16)
            view_item.height(80)
            stack_items!.addArrangedSubview(view_item)
        }
        
        btn_make_order!.click =
            {
                listener.clickedMakeOrder(sum: self.getBasketSum(items: items))
        }
        
        scroll_items!.resizeScrollToStack(stack: stack_items!)
        lbl_sum?.text = getSumAsString(items: items)
    }
    
    func getBasketSum(items:[Model_Added_Item])->Double
    {
        var sum:Double = 0
        
        for item in items
        {
            sum+=item.sum!
        }
        
        return sum
    }
    
    func getSumAsString(items:[Model_Added_Item])->String
    {
        return "\(Int(getBasketSum(items: items))) р"
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
}
