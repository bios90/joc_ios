import Foundation
import UIKit

class RestView:UIView
{
    var restaraunt : Model_Restaraunt?
    var distance:Int?
    
    var img_logo : UIImageView?
    var lbl_cafe_name : MyLabel?
    var lbl_adress : MyLabel?
    var rating_view:RatingView?
    var lbl_time:MyLabel?
    var lbl_distance:MyLabel?
    
    
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
        shadow_subview.widthAnchor.constraint(equalToConstant: 94).isActive = true
        shadow_subview.heightAnchor.constraint(equalToConstant: 94).isActive = true
        shadow_subview.leftAnchor.constraint(equalTo: la_root.leftAnchor, constant: 16).isActive = true
        shadow_subview.centerYAnchor.constraint(equalTo: la_root.centerYAnchor).isActive = true
        shadow_subview.layoutIfNeeded()
        
        
        
        img_logo = CircleImage()
        img_logo?.translatesAutoresizingMaskIntoConstraints = false
        img_logo?.image = UIImage(named: restaraunt!.logo!)
        
        shadow_subview.addSubview(img_logo!)
        img_logo!.widthAnchor.constraint(equalTo: shadow_subview.widthAnchor).isActive = true
        img_logo!.heightAnchor.constraint(equalTo: shadow_subview.heightAnchor).isActive = true
        img_logo!.centerXAnchor.constraint(equalTo: shadow_subview.centerXAnchor).isActive = true
        img_logo!.centerYAnchor.constraint(equalTo: shadow_subview.centerYAnchor).isActive = true
        img_logo?.layoutIfNeeded()
        
        
        let la_right_view = UIView()
        la_right_view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(la_right_view)
        la_right_view.leftAnchor.constraint(equalTo: img_logo!.rightAnchor, constant: 8).isActive = true
        la_right_view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        la_right_view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        la_right_view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        la_right_view.layoutIfNeeded()
        
        
        
        lbl_cafe_name = MyLabel()
        lbl_cafe_name!.font = Fonts.getInstance.font_bold_m
        lbl_cafe_name!.textColor = Colors.getInstance.gray5
        lbl_cafe_name!.textAlignment = .center
        lbl_cafe_name!.text = restaraunt!.name
        lbl_cafe_name!.numberOfLines = 1
        
        la_right_view.addSubview(lbl_cafe_name!)
        lbl_cafe_name!.topAnchor.constraint(equalTo: la_right_view.topAnchor, constant: 12).isActive = true
        lbl_cafe_name!.centerXAnchor.constraint(equalTo: la_right_view.centerXAnchor).isActive = true
        lbl_cafe_name!.sizeToFit()
        lbl_cafe_name!.layoutIfNeeded()
        
        
        lbl_adress = MyLabel()
        lbl_adress!.font = Fonts.getInstance.font_reg_xxxs
        lbl_adress!.textColor = Colors.getInstance.gray2
        lbl_adress?.textAlignment = .center
        lbl_adress?.text = restaraunt!.adress
        lbl_adress!.numberOfLines = 1
        
        la_right_view.addSubview(lbl_adress!)
        lbl_adress!.topAnchor.constraint(equalTo: lbl_cafe_name!.bottomAnchor, constant: 2).isActive = true
        lbl_adress!.centerXAnchor.constraint(equalTo: la_right_view.centerXAnchor).isActive = true
        lbl_adress!.layoutIfNeeded()
        
        
        
        rating_view = RatingView(rating: restaraunt!.rating, can_touch: false,width: 15.0,distance: 1.0)
        la_right_view.addSubview(rating_view!)
        
        rating_view!.widthAnchor.constraint(equalToConstant: CGFloat(rating_view!.get_sized_width())).isActive = true
        rating_view!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rating_view!.centerXAnchor.constraint(equalTo: la_right_view.centerXAnchor).isActive = true
        rating_view!.topAnchor.constraint(equalTo: lbl_adress!.bottomAnchor, constant: 10).isActive = true
        rating_view!.layoutIfNeeded()
        
        
        let lbl_ic_time = FawLabel()
        lbl_ic_time.textColor = Colors.getInstance.gray3
        lbl_ic_time.text = FawStrings.clockO
        lbl_ic_time.font = Fonts.getInstance.font_faw_light_s
        
        la_right_view.addSubview(lbl_ic_time)
        lbl_ic_time.leftAnchor.constraint(equalTo: la_right_view.leftAnchor, constant: 28).isActive = true
        lbl_ic_time.topAnchor.constraint(equalTo: rating_view!.bottomAnchor, constant: 12).isActive = true
        lbl_ic_time.sizeToFit()
        lbl_ic_time.layoutIfNeeded()
        
        
        lbl_time = MyLabel()
        lbl_time!.text = restaraunt?.get_work_hours_string()
        lbl_time!.textColor = Colors.getInstance.gray3
        lbl_time!.font = Fonts.getInstance.font_semi_xxxs
        
        la_right_view.addSubview(lbl_time!)
        lbl_time!.topAnchor.constraint(equalTo: lbl_ic_time.topAnchor, constant: 3).isActive = true
        lbl_time!.leftAnchor.constraint(equalTo: lbl_ic_time.rightAnchor,constant: 8).isActive = true
        lbl_time!.sizeToFit()
        lbl_time!.layoutIfNeeded()
        
        
        lbl_distance = MyLabel()
        lbl_distance!.text = "\(distance!) м"
        lbl_distance!.textColor = Colors.getInstance.gray3
        lbl_distance!.font = Fonts.getInstance.font_semi_xxxs
        
        la_right_view.addSubview(lbl_distance!)
        lbl_distance!.rightAnchor.constraint(equalTo: la_right_view.rightAnchor, constant: -28).isActive = true
        lbl_distance!.topAnchor.constraint(equalTo: lbl_time!.topAnchor).isActive = true
        lbl_distance!.sizeToFit()
        lbl_distance!.layoutIfNeeded()
        
        
        let lbl_ic_dictance = FawLabel()
        lbl_ic_dictance.textColor = Colors.getInstance.gray3
        lbl_ic_dictance.text = FawStrings.locationArrow
        lbl_ic_dictance.font = Fonts.getInstance.font_faw_light_s
        
        la_right_view.addSubview(lbl_ic_dictance)
        lbl_ic_dictance.rightAnchor.constraint(equalTo: lbl_distance!.leftAnchor, constant: -8).isActive = true
        lbl_ic_dictance.topAnchor.constraint(equalTo: lbl_ic_time.topAnchor).isActive = true
        lbl_ic_dictance.sizeToFit()
        lbl_ic_dictance.layoutIfNeeded()
        
        self.remove_child_clicks()
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    @objc func pressed()
    {
        click?()
    }
    
    init(restaraunt:Model_Restaraunt,distance:Int)
    {
        self.restaraunt = restaraunt
        self.distance = distance
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
}

protocol RestarauntCardListener
{
    func clicked_card(restaraunt:Model_Restaraunt)
}
