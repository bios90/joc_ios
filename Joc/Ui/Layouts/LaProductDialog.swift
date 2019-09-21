import UIKit
import SwiftEntryKit


protocol ProductDialogListener
{
    func clickedAdd(counter:CounterHelper)
}

class LaProductDialog: UIView
{
    var product:Model_Product?
    var listener:ProductDialogListener?
    
    private var topview:UIView?
    var img:UIImageView?
    var la_overlay:UIView?
    var lbl_desc:UILabel?
    var lbl_name:UILabel?
    var lbl_sum:UILabel?
    var btn_add:BtnGreenGrad?
    
    var scroll_weights: UIScrollView?
    var stack_weights: UIStackView?
    
    var scroll_sugar: UIScrollView?
    var stack_sugar: UIStackView?
    
    var scroll_milk: UIScrollView?
    var stack_milk: UIStackView?
    
    var scroll_adds: UIScrollView?
    var stack_adds: UIStackView?
    
    private var lastBottomView:UIView?
    private var counterHelper:CounterHelper?
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init (product:Model_Product,listener:ProductDialogListener)
    {
        self.listener = listener
        self.product = product
        super.init(frame: CGRect.zero)
        customInit()
    }
    
    func customInit()
    {
        counterHelper = CounterHelper(dialog: self)
        self.backgroundColor = Colors.getInstance.gray0
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        let top_view_height = Configs.screenWidth * 0.4
        topview = UIView()
        self.addSubview(topview!)
        topview!.setAnchor(top: self.topAnchor, left: self.leftAnchor , bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 0,height: top_view_height)
        
        img = UIImageView()
        img!.contentMode = .scaleAspectFill
        img!.clipsToBounds = true
        img!.image = UIImage(named: product!.img_name!)
        img!.addToFillOther(view: topview!)
        
        la_overlay = UIView()
        la_overlay!.addToFillOther(view: topview!)
        
        
        lbl_desc = MyLabel()
        lbl_desc!.textColor = Colors.getInstance.white
        lbl_desc!.text = product!.desc
        lbl_desc!.font = Fonts.getInstance.font_reg_xxxs
        lbl_desc!.numberOfLines = 0
        topview!.addSubview(lbl_desc!)
        lbl_desc!.setAnchor(top: nil, left: topview!.leftAnchor, bottom: topview!.bottomAnchor, right: topview!.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: 8, paddingRight: 12)
        lbl_desc!.sizeToFit()
        
        lbl_name = MyLabel()
        lbl_name!.textColor = Colors.getInstance.white
        lbl_name!.text = product!.name
        lbl_name!.font = Fonts.getInstance.font_semi_m
        topview!.addSubview(lbl_name!)
        lbl_name!.setAnchor(top: nil, left: lbl_desc?.leftAnchor, bottom: lbl_desc?.topAnchor, right: lbl_desc?.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 0)
        
        lastBottomView = topview
        
        
        if(product!.type != 2)
        {
            add_weights()
            add_sugar()
            if(product!.milks.count > 0)
            {
                add_milks()
            }
            if(product!.adds.count > 0)
            {
                add_adds()
            }
        }
        
        let bottom_view = UIView()
        bottom_view.add_light_shadow()
        bottom_view.backgroundColor = Colors.getInstance.white
        self.addSubview(bottom_view)
        bottom_view.topToBottom(of: lastBottomView!)
        bottom_view.leftToSuperview()
        bottom_view.rightToSuperview()
        
        let lbl_sum_title = MyLabel()
        lbl_sum_title.text = "Сумма : "
        lbl_sum_title.font = Fonts.getInstance.font_semi_xs
        lbl_sum_title.textColor = Colors.getInstance.gray4
        lbl_sum_title.textAlignment = .right
        bottom_view.addSubview(lbl_sum_title)
        lbl_sum_title.width(to: bottom_view,multiplier:0.49)
        lbl_sum_title.height(24)
        lbl_sum_title.topToSuperview(offset:12)
        lbl_sum_title.leftToSuperview()
        
        
        lbl_sum = MyLabel()
        lbl_sum!.text = ""
        lbl_sum!.font = Fonts.getInstance.font_bold_xs
        lbl_sum!.textColor = Colors.getInstance.gray4
        lbl_sum?.textAlignment = .left
        bottom_view.addSubview(lbl_sum!)
        lbl_sum!.width(to: bottom_view,multiplier:0.49)
        lbl_sum!.height(24)
        lbl_sum!.topToSuperview(offset:12)
        lbl_sum!.rightToSuperview()
        
        
        btn_add = BtnGreenGrad()
        btn_add!.setTitle("Добавить", for: .normal)
        btn_add!.titleLabel!.font = Fonts.getInstance.font_bold_xs
        btn_add!.titleLabel!.textColor = Colors.getInstance.white
        btn_add!.layer.cornerRadius = 4
        bottom_view.addSubview(btn_add!)
        btn_add!.topToBottom(of: lbl_sum_title,offset:12)
        btn_add!.leftToSuperview(offset:12)
        btn_add!.rightToSuperview(offset:-12)
        btn_add!.height(36)
        btn_add!.click =
            {
                SwiftEntryKit.dismiss()
                self.listener!.clickedAdd(counter: self.counterHelper!)
        }
        
        var padding_bottom:CGFloat = 12
        
        if(UIDevice.current.monobrow_screen)
        {
            padding_bottom = 46
        }
        bottom_view.resize_to_fit_vertical(padding_bottom: padding_bottom)
        
    
        counterHelper!.recount()
    }
    
    func add_adds()
    {
        let lbl_adds_title = MyLabel()
        lbl_adds_title.text = "Добавки"
        lbl_adds_title.font = Fonts.getInstance.font_reg_xs
        lbl_adds_title.textColor = Colors.getInstance.gray4
        self.addSubview(lbl_adds_title)
        lbl_adds_title.topToBottom(of: lastBottomView!,offset:12)
        lbl_adds_title.leftToSuperview(offset:12)
        
        scroll_adds = UIScrollView()
        self.addSubview(scroll_adds!)
        scroll_adds!.leftToSuperview(offset:12)
        scroll_adds!.rightToSuperview(offset:12)
        scroll_adds!.topToBottom(of: lbl_adds_title,offset: 8)
        scroll_adds!.height(32)
        scroll_adds!.showsHorizontalScrollIndicator = false
        
        stack_adds = UIStackView()
        scroll_adds!.addSubview(stack_adds!)
        stack_adds!.leftToSuperview()
        stack_adds!.topToSuperview()
        stack_adds!.axis = .horizontal
        stack_adds!.distribution = .fill
        stack_adds!.alignment = .center
        stack_adds!.spacing = 20
        
        for i in 0..<product!.adds.count
        {
            let add = product!.adds[i]
            
            let toggle = BtnRoundedToggle(item:add)
            
            toggle.height(32)
            let width = toggle.lbl_text!.frame.width+40
            toggle.width(width)
            stack_adds!.addArrangedSubview(toggle)
            
            toggle.click =
                {
                    self.clickedAdd(add: add, clicked_toggle: toggle)
            }
        }
        
        stack_adds!.sizeToFit()
        stack_adds!.layoutIfNeeded()
        scroll_adds!.contentSize.width = stack_adds!.frame.width+40
        scroll_adds!.contentSize.height = stack_adds!.frame.height
        
        let bottom_line = UIView()
        bottom_line.backgroundColor = Colors.getInstance.gray1
        self.addSubview(bottom_line)
        bottom_line.topToBottom(of: scroll_adds!,offset: 12)
        bottom_line.leftToSuperview()
        bottom_line.rightToSuperview()
        bottom_line.height(1)
        
        lastBottomView = bottom_line
    }
    
    func add_milks()
    {
        let lbl_milk_title = MyLabel()
        lbl_milk_title.text = "Молоко"
        lbl_milk_title.font = Fonts.getInstance.font_reg_xs
        lbl_milk_title.textColor = Colors.getInstance.gray4
        self.addSubview(lbl_milk_title)
        lbl_milk_title.topToBottom(of: lastBottomView!,offset:12)
        lbl_milk_title.leftToSuperview(offset:12)
        
        scroll_milk = UIScrollView()
        self.addSubview(scroll_milk!)
        scroll_milk!.leftToSuperview(offset:12)
        scroll_milk!.rightToSuperview(offset:12)
        scroll_milk!.topToBottom(of: lbl_milk_title,offset: 8)
        scroll_milk!.height(32)
        scroll_milk!.showsHorizontalScrollIndicator = false
        
        stack_milk = UIStackView()
        scroll_milk!.addSubview(stack_milk!)
        stack_milk!.leftToSuperview()
        stack_milk!.topToSuperview()
        stack_milk!.axis = .horizontal
        stack_milk!.distribution = .fill
        stack_milk!.alignment = .center
        stack_milk!.spacing = 20
        
        for i in 0..<product!.milks.count
        {
            let milk = product!.milks[i]
            
            let toggle = BtnRoundedToggle(item:milk)
            
            toggle.height(32)
            let width = toggle.lbl_text!.frame.width+40
            toggle.width(width)
            stack_milk!.addArrangedSubview(toggle)
            
            toggle.click =
                {
                    self.clickedMilk(milk: milk, clicked_toggle: toggle)
            }
        }
        
        stack_milk!.sizeToFit()
        stack_milk!.layoutIfNeeded()
        scroll_milk!.contentSize.width = stack_milk!.frame.width+40
        scroll_milk!.contentSize.height = stack_milk!.frame.height
        
        let bottom_line = UIView()
        bottom_line.backgroundColor = Colors.getInstance.gray1
        self.addSubview(bottom_line)
        bottom_line.topToBottom(of: scroll_milk!,offset: 12)
        bottom_line.leftToSuperview()
        bottom_line.rightToSuperview()
        bottom_line.height(1)
        
        lastBottomView = bottom_line
    }
    
    func add_sugar()
    {
        let lbl_weight_title = MyLabel()
        lbl_weight_title.text = "Сахар"
        lbl_weight_title.font = Fonts.getInstance.font_reg_xs
        lbl_weight_title.textColor = Colors.getInstance.gray4
        self.addSubview(lbl_weight_title)
        lbl_weight_title.topToBottom(of: lastBottomView!,offset:12)
        lbl_weight_title.leftToSuperview(offset:12)
        
        scroll_sugar = UIScrollView()
        self.addSubview(scroll_sugar!)
        scroll_sugar!.leftToSuperview(offset:12)
        scroll_sugar!.rightToSuperview(offset:12)
        scroll_sugar!.topToBottom(of: lbl_weight_title,offset: 8)
        scroll_sugar!.height(32)
        scroll_sugar!.showsHorizontalScrollIndicator = false
        
        stack_sugar = UIStackView()
        scroll_sugar!.addSubview(stack_sugar!)
        stack_sugar!.leftToSuperview()
        stack_sugar!.topToSuperview()
        stack_sugar!.axis = .horizontal
        stack_sugar!.distribution = .fill
        stack_sugar!.alignment = .center
        stack_sugar!.spacing = 20
        
        for i in 0...3
        {
            var text = ""
            if(i == 0)
            {
                text = "Без сахара"
            }else
            {
                text = "\(i)"
            }
            
            let toggle = BtnRoundedToggle(item: text)
            
            toggle.height(32)
            var width = toggle.lbl_text!.frame.width+40
            
            if(width < 80)
            {
                width = 80
            }
            
            toggle.width(width)
            stack_sugar!.addArrangedSubview(toggle)
            
            toggle.click =
                {
                    self.clicked_sugar(pos: i, clicked_toggle: toggle)
            }
            
            if(i == 0)
            {
                toggle.setOn()
            }
        }
        
        stack_sugar!.sizeToFit()
        stack_sugar!.layoutIfNeeded()
        scroll_sugar!.contentSize.width = stack_sugar!.frame.width+40
        scroll_sugar!.contentSize.height = stack_sugar!.frame.height
        
        let bottom_line = UIView()
        bottom_line.backgroundColor = Colors.getInstance.gray1
        self.addSubview(bottom_line)
        bottom_line.topToBottom(of: scroll_sugar!,offset: 12)
        bottom_line.leftToSuperview()
        bottom_line.rightToSuperview()
        bottom_line.height(1)
        
        lastBottomView = bottom_line
    }
    
    func add_weights()
    {
        let lbl_weight_title = MyLabel()
        lbl_weight_title.text = "Объем"
        lbl_weight_title.font = Fonts.getInstance.font_reg_xs
        lbl_weight_title.textColor = Colors.getInstance.gray4
        self.addSubview(lbl_weight_title)
        lbl_weight_title.topToBottom(of: lastBottomView!,offset:12)
        lbl_weight_title.leftToSuperview(offset:12)
        
        
        scroll_weights = UIScrollView()
        self.addSubview(scroll_weights!)
        scroll_weights!.leftToSuperview(offset:12)
        scroll_weights!.rightToSuperview(offset:12)
        scroll_weights!.topToBottom(of: lbl_weight_title,offset: 8)
        scroll_weights!.height(32)
        scroll_weights!.showsHorizontalScrollIndicator = false
        
        stack_weights = UIStackView()
        scroll_weights!.addSubview(stack_weights!)
        stack_weights!.leftToSuperview()
        stack_weights!.topToSuperview()
        stack_weights!.axis = .horizontal
        stack_weights!.distribution = .fill
        stack_weights!.alignment = .center
        stack_weights!.spacing = 20
        
        for i in 0..<product!.weights.count
        {
            let weight = product!.weights[i]
            
            let toggle = BtnRoundedToggle(item:weight)
            
            toggle.height(32)
            let width = toggle.lbl_text!.frame.width+40
            toggle.width(width)
            stack_weights!.addArrangedSubview(toggle)
            
            toggle.click =
                {
                    self.clickedWeight(weight: weight, clicked_toggle: toggle)
            }
            
            if(i == 0)
            {
                toggle.setOn()
            }
        }
        
        stack_weights!.sizeToFit()
        stack_weights!.layoutIfNeeded()
        scroll_weights!.contentSize.width = stack_weights!.frame.width+40
        scroll_weights!.contentSize.height = stack_weights!.frame.height
        
        let bottom_line = UIView()
        bottom_line.backgroundColor = Colors.getInstance.gray1
        self.addSubview(bottom_line)
        bottom_line.topToBottom(of: scroll_weights!,offset: 12)
        bottom_line.leftToSuperview()
        bottom_line.rightToSuperview()
        bottom_line.height(1)
        
        lastBottomView = bottom_line
    }
    
    override func draw(_ rect: CGRect)
    {
        let color1 = Colors.getInstance.gray5
        let color2 = UIColor.clear
        let gradLayer = Colors.getInstance.getGradient(color1: color1, color2: color2, horizontal: false)
        
        la_overlay!.make_gradient(grad_layer: gradLayer)
    }
    
    func clickedAdd(add:Model_Add,clicked_toggle:BtnRoundedToggle)
    {
        clicked_toggle.toggle()
        
        counterHelper!.recount()
    }
    
    func clickedMilk(milk: Model_Milk, clicked_toggle:BtnRoundedToggle)
    {
        for view in stack_milk!.subviews
        {
            let toggle = view as! BtnRoundedToggle
            
            if(view == clicked_toggle)
            {
                toggle.toggle()
            }else
            {
                toggle.setOff()
            }
        }
        
        counterHelper!.recount()
    }
    
    func clickedWeight(weight: Model_Weight, clicked_toggle:BtnRoundedToggle)
    {
        for view in stack_weights!.subviews
        {
            let toggle = view as! BtnRoundedToggle
            
            if(view == clicked_toggle)
            {
                toggle.setOn()
            }else
            {
                toggle.setOff()
            }
        }
        
        counterHelper!.recount()
    }
    
    func clicked_sugar(pos:Int,clicked_toggle:BtnRoundedToggle)
    {
        for view in stack_sugar!.subviews
        {
            let toggle = view as! BtnRoundedToggle
            
            if(view == clicked_toggle)
            {
                toggle.setOn()
            }else
            {
                toggle.setOff()
            }
        }
    }
}
