
import UIKit

class LaProduct: UIView
{
    var product:Model_Product?
    var img_logo:UIImageView?
    var la_right:UIView?
    var lbl_name : MyLabel?
    var lbl_desc:MyLabel?
    var lbl_price:MyLabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (product:Model_Product)
    {
        super.init(frame: CGRect.zero)
        self.product = product
        customInit()
    }

    func customInit()
    {
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 4
        
        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_oppacity = 0.3
        
        self.addSubview(shadow_subview)
        shadow_subview.setAnchor(top: nil, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0,width: 80,height: 80)
        
        
        img_logo = CircleImage()
        img_logo?.image = UIImage(named: product!.img_name!)
        
        shadow_subview.addSubview(img_logo!)
        img_logo?.setAnchor(top: shadow_subview.topAnchor, left: shadow_subview.leftAnchor, bottom: shadow_subview.bottomAnchor, right: shadow_subview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        la_right = UIView()
        self.addSubview(la_right!)
        la_right?.setAnchor(top: self.topAnchor, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 76,height: 0)
        
        lbl_name = MyLabel()
        lbl_name!.font = Fonts.getInstance.font_bold_s
        lbl_name!.textColor = Colors.getInstance.gray4
        lbl_name!.text = product?.name!
        self.addSubview(lbl_name!)
        lbl_name?.setAnchor(top: self.topAnchor, left: shadow_subview.rightAnchor, bottom: nil, right: la_right?.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8)
        lbl_name?.sizeToFit()
        
        lbl_desc = MyLabel()
        lbl_desc!.font = Fonts.getInstance.font_semi_xxxs
        lbl_desc!.textColor = Colors.getInstance.gray2
        lbl_desc!.text = product?.desc!
        lbl_desc?.numberOfLines = 4
        self.addSubview(lbl_desc!)
        lbl_desc!.setAnchor(top: lbl_name?.bottomAnchor, left: lbl_name?.leftAnchor, bottom: nil, right: lbl_name?.rightAnchor, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        lbl_desc?.sizeToFit()
        
        
        lbl_price = MyLabel()
        lbl_price!.font = Fonts.getInstance.font_bold_xxs
        lbl_price!.textColor = Colors.getInstance.white
        lbl_price!.text = product?.get_price_text_min()
        lbl_price?.textAlignment = .center
        self.addSubview(lbl_price!)
        lbl_price!.setAnchor(top: la_right!.topAnchor, left: la_right!.leftAnchor, bottom: la_right!.bottomAnchor, right: la_right!.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        self.add_shadow()
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        var gradient_layer : CAGradientLayer
        gradient_layer = Colors.getInstance.getGreenNotifyGradient()
        la_right!.roundCorners([.topRight, .bottomRight], radius: 4)
        la_right!.make_gradient(grad_layer: gradient_layer)
        
//        let desc_height = lbl_desc?.frame.size.height
//        
//        if(Int(desc_height!) < 60)
//        {
//            self.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        }
//        else
//        {
//            self.bottomAnchor.constraint(equalTo: lbl_desc!.bottomAnchor, constant: 8).isActive = true
//        }
    }
}
