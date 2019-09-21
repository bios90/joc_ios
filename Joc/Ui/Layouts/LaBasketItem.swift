
import UIKit
import TinyConstraints

class LaBasketItem: UIView
{
    var added_item:Model_Added_Item?
    
    var img_logo:UIImageView?
    var lbl_name:MyLabel?
    var lbl_price:MyLabel?
    var lbl_remove:FawLabel?
    var listener : BasketItemListener?
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init (added_item:Model_Added_Item, listener:BasketItemListener)
    {
        self.added_item = added_item
        self.listener = listener
        super.init(frame: CGRect.zero)
        customInit()
    }
    
    func customInit()
    {
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 4
        self.add_light_shadow()
        
        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_oppacity = 0.3
        
        self.addSubview(shadow_subview)
        shadow_subview.width(60)
        shadow_subview.height(60)
        shadow_subview.leftToSuperview(offset:12)
        shadow_subview.centerYToSuperview()
       
        img_logo = CircleImage()
        img_logo!.image = UIImage(named: added_item!.product!.img_name!)
        
        shadow_subview.addSubview(img_logo!)
        img_logo!.edgesToSuperview()
        
        
        lbl_price = MyLabel()
        lbl_price!.textColor = Colors.getInstance.gray5
        lbl_price!.font = Fonts.getInstance.font_semi_xxs
        lbl_price!.text = added_item!.getSumText()
        lbl_price!.textAlignment = .center
        
        self.addSubview(lbl_price!)
        lbl_price!.rightToSuperview()
        lbl_price!.centerYToSuperview()
        lbl_price!.width(60)
        lbl_price!.sizeToFit()
        
        lbl_name = MyLabel()
        lbl_name!.textColor = Colors.getInstance.gray4
        lbl_name!.font = Fonts.getInstance.font_semi_xs
        lbl_name!.text = added_item!.product!.name!
        lbl_name!.textAlignment = .left
        self.addSubview(lbl_name!)
        
        lbl_name!.leftToRight(of: shadow_subview,offset: 10)
        lbl_name!.rightToLeft(of: lbl_price!,offset: 10)
        lbl_name!.topToSuperview(offset:6)
        lbl_name!.sizeToFit()
        
        lbl_remove = FawLabel()
        lbl_remove!.text = FawStrings.times
        lbl_remove!.textColor = Colors.getInstance.red
        self.addSubview(lbl_remove!)
        lbl_remove!.width(20)
        lbl_remove!.height(20)
        lbl_remove!.font = Fonts.getInstance.font_faw_light_xs
        lbl_remove!.topToSuperview(offset:4)
        lbl_remove!.rightToSuperview(offset:-4)
        
        lbl_remove?.click =
            {
                self.listener?.clickedDelete(item: self.added_item!)
        }
        
        if(added_item!.product!.type == 0 || added_item!.product!.type == 1)
        {
            let row1 = UIStackView()
            self.addSubview(row1)
            row1.leftToRight(of: shadow_subview,offset:4)
            row1.rightToLeft(of: lbl_price!,offset:4)
            row1.topToBottom(of: lbl_name!,offset: 8)
            row1.axis = .horizontal
            row1.height(16)
            row1.distribution = .fillEqually
            row1.spacing = 0
            
            let titleWeight = getLightGrayTitle(text: "Объем")
            row1.addArrangedSubview(titleWeight)
            
            let titleSugar = getLightGrayTitle(text: "Сахар")
            row1.addArrangedSubview(titleSugar)
            
            let titleMilk = getLightGrayTitle(text: "Молоко")
            row1.addArrangedSubview(titleMilk)
            
            
            let row2 = UIStackView()
            self.addSubview(row2)
            row2.leftToRight(of: shadow_subview,offset:4)
            row2.rightToLeft(of: lbl_price!,offset:4)
            row2.topToBottom(of: row1,offset: 0)
            row2.axis = .horizontal
            row2.height(16)
            row2.distribution = .fillEqually
            row2.spacing = 0
            
            
            let lbl_weight = getGrayElement(text: added_item!.getWeightText())
            row2.addArrangedSubview(lbl_weight)
            
            let lbl_sugar = getGrayElement(text: added_item!.getSugarText())
            row2.addArrangedSubview(lbl_sugar)
            
            let lbl_milk = getGrayElement(text: added_item!.getMilkText())
            row2.addArrangedSubview(lbl_milk)
        }
        
    }
    
    
    func getLightGrayTitle(text:String)->MyLabel
    {
        var lbl = MyLabel()
        lbl.textColor = Colors.getInstance.gray2
        lbl.font = Fonts.getInstance.font_reg_tiny
        lbl.text = text
        lbl.textAlignment = .center
        lbl.height(16)
        
        return lbl
    }
    
    
    func getGrayElement(text:String)->MyLabel
    {
        var lbl = MyLabel()
        lbl.textColor = Colors.getInstance.gray4
        lbl.font = Fonts.getInstance.font_reg_xxxs
        lbl.text = text
        lbl.textAlignment = .center
        lbl.height(16)
        
        return lbl
    }



}
