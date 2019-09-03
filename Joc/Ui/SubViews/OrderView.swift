import Foundation
import UIKit

class OrderView:UIView
{
    var order:Model_Order?
    
    var img_logo : UIImageView?
    var lbl_cafe_name : MyLabel?
    var lbl_adress : MyLabel?
    var lbl_items : MyLabel?
    var right_view : UIView?
    var lbl_sum:MyLabel?
    var lbl_time:MyLabel?
    
    var click : (() -> Void)?
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let la_root = ShadowRoundView()
        la_root.shadow_radius = 4
        la_root.cornerRadius = 4
        la_root.shadow_oppacity = 0.2
        la_root.shadow_offset = CGSize(width: 0, height: 0)
        
        self.addSubview(la_root)
        la_root.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        la_root.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        la_root.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        la_root.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        la_root.layoutIfNeeded()
        
        
        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_radius = 4
        shadow_subview.shadow_oppacity = 0.3
        
        la_root.addSubview(shadow_subview)
        shadow_subview.widthAnchor.constraint(equalToConstant: 68).isActive = true
        shadow_subview.heightAnchor.constraint(equalToConstant: 68).isActive = true
        shadow_subview.leftAnchor.constraint(equalTo: la_root.leftAnchor, constant: 8).isActive = true
        shadow_subview.centerYAnchor.constraint(equalTo: la_root.centerYAnchor).isActive = true
        shadow_subview.layoutIfNeeded()
        
        
        
        img_logo = CircleImage()
        img_logo?.translatesAutoresizingMaskIntoConstraints = false
        img_logo?.image = UIImage(named: order!.restaraunt!.logo!)

        shadow_subview.addSubview(img_logo!)
        img_logo!.widthAnchor.constraint(equalTo: shadow_subview.widthAnchor).isActive = true
        img_logo!.heightAnchor.constraint(equalTo: shadow_subview.heightAnchor).isActive = true
        img_logo!.centerXAnchor.constraint(equalTo: shadow_subview.centerXAnchor).isActive = true
        img_logo!.centerYAnchor.constraint(equalTo: shadow_subview.centerYAnchor).isActive = true
        img_logo?.layoutIfNeeded()
        
        



        lbl_cafe_name = MyLabel()
        lbl_cafe_name?.font = Fonts.getInstance.font_bold_m
        lbl_cafe_name?.textColor = Colors.getInstance.gray5
        lbl_cafe_name?.textAlignment = .center
        lbl_cafe_name!.text = order?.restaraunt?.name
        lbl_cafe_name?.numberOfLines = 1

        la_root.addSubview(lbl_cafe_name!)
        lbl_cafe_name?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -172).isActive = true
        lbl_cafe_name!.topAnchor.constraint(equalTo: la_root.topAnchor, constant: 12).isActive = true
        lbl_cafe_name?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_cafe_name?.sizeToFit()
        lbl_cafe_name?.layoutIfNeeded()




        lbl_adress = MyLabel()
        lbl_adress!.font = Fonts.getInstance.font_reg_xxxs
        lbl_adress!.textColor = Colors.getInstance.gray2
        lbl_adress?.textAlignment = .center
        lbl_adress?.text = order?.restaraunt?.adress
        lbl_adress!.numberOfLines = 1

        la_root.addSubview(lbl_adress!)
        lbl_adress!.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -172).isActive = true
        lbl_adress!.topAnchor.constraint(equalTo: lbl_cafe_name!.bottomAnchor, constant: 2).isActive = true
        lbl_adress!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_adress!.layoutIfNeeded()



        lbl_items = MyLabel()
        lbl_items!.font = Fonts.getInstance.font_reg_xxxs
        lbl_items!.textColor = Colors.getInstance.gray5
        lbl_items!.textAlignment = .left
        lbl_items!.text = order!.items
        lbl_items!.numberOfLines = 2

        la_root.addSubview(lbl_items!)
        lbl_items!.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -172).isActive = true
        lbl_items!.topAnchor.constraint(equalTo: lbl_adress!.bottomAnchor, constant: 12).isActive = true
        lbl_items!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_items!.sizeToFit()
        lbl_items!.layoutIfNeeded()
        
        
        
        
        right_view = UIView()
        right_view!.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(right_view!)
        right_view!.widthAnchor.constraint(equalToConstant: 84).isActive = true
        right_view!.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        right_view!.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        right_view!.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        right_view!.layoutIfNeeded()
        
        
        let lbl_time_title = MyLabel()
        lbl_time_title.text = "Время :"
        lbl_time_title.textAlignment = .center
        lbl_time_title.textColor = Colors.getInstance.white
        lbl_time_title.font = Fonts.getInstance.font_reg_tiny
        
        self.addSubview(lbl_time_title)
        lbl_time_title.topAnchor.constraint(equalTo: self.topAnchor,constant:15).isActive = true
        lbl_time_title.centerXAnchor.constraint(equalTo: right_view!.centerXAnchor).isActive = true
        lbl_time_title.sizeToFit()
        
        
        
        let time_str = order?.date?.fotmatToString(format: DateManager.FORMAT_TIME)
        
        lbl_time = MyLabel()
        lbl_time!.text = time_str
        lbl_time!.textColor = Colors.getInstance.white
        lbl_time!.font = Fonts.getInstance.font_bold_xxs
        
        self.addSubview(lbl_time!)
        lbl_time!.topAnchor.constraint(equalTo: lbl_time_title.bottomAnchor).isActive = true
        lbl_time!.centerXAnchor.constraint(equalTo: right_view!.centerXAnchor).isActive = true
        lbl_time?.sizeToFit()
        

        
        
        var sum_text = "\(Int(order!.sum)) р"
        if(order?.status == 0)
        {
            sum_text = "Отмена"
        }
        
        lbl_sum = MyLabel()
        lbl_sum!.text = sum_text
        lbl_sum!.textColor = Colors.getInstance.white
        lbl_sum!.font = Fonts.getInstance.font_bold_xxs
        
        self.addSubview(lbl_sum!)
        lbl_sum!.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -15).isActive = true
        lbl_sum!.centerXAnchor.constraint(equalTo: right_view!.centerXAnchor).isActive = true
        lbl_sum!.sizeToFit()
        
        
        let lbl_sum_title = MyLabel()
        lbl_sum_title.text = "Cумма"
        lbl_sum_title.textColor = Colors.getInstance.white
        lbl_sum_title.font = Fonts.getInstance.font_reg_tiny
        
        self.addSubview(lbl_sum_title)
        lbl_sum_title.bottomAnchor.constraint(equalTo: lbl_sum!.topAnchor).isActive = true
        lbl_sum_title.centerXAnchor.constraint(equalTo: right_view!.centerXAnchor).isActive = true
        lbl_sum_title.sizeToFit()
        
        

        
        self.remove_child_clicks()
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    @objc func pressed()
    {
        click?()
    }
    
    init(order:Model_Order)
    {
        self.order = order
        super.init(frame: CGRect())
        customInit()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override func layoutSubviews()
    {
         super.layoutSubviews()
        
        var gradient_layer : CAGradientLayer
        if(order!.status == 1)
        {
            gradient_layer = Colors.getInstance.getGreenNotifyGradient()
        }else
        {
            gradient_layer = Colors.getInstance.getGrayOrderGradient()
        }
        
        right_view!.roundCorners([.topRight, .bottomRight], radius: 4)

        right_view!.make_gradient(grad_layer: gradient_layer)
    }
}

protocol OrderCardListener
{
    func clicked_card(order:Model_Order)
}
