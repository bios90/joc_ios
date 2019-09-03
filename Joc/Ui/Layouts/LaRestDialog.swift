import Foundation
import UIKit

class LaRestDialog : UIView
{
    var restaraunt:Model_Restaraunt?
    var btn_to_restaraunt:BtnOrange?
    var img_logo:UIImageView?
    var lbl_cafe_name:MyLabel?
    var lbl_adress:MyLabel?
    var rating_view:RatingView?
    var lbl_distance:MyLabel?
    var lbl_description:MyLabel?
    var lbl_time:MyLabel?

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (restaunt:Model_Restaraunt)
    {
        super.init(frame: CGRect.zero)
        self.restaraunt = restaunt
        customInit()
    }
    
    override func draw(_ rect: CGRect)
    {
                self.roundCorners([.topLeft,.topRight], radius: 4)
    }
    
    func customInit()
    {
        print("Called here")
        
        self.backgroundColor = Colors.getInstance.white
        self.translatesAutoresizingMaskIntoConstraints = false

        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_oppacity = 0.3
        
        self.addSubview(shadow_subview)
        shadow_subview.widthAnchor.constraint(equalToConstant: 112).isActive = true
        shadow_subview.heightAnchor.constraint(equalToConstant: 112).isActive = true
        shadow_subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        shadow_subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
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
        
        lbl_cafe_name = MyLabel()
        lbl_cafe_name!.text = restaraunt!.name!
        lbl_cafe_name!.font = Fonts.getInstance.font_bold_l
        lbl_cafe_name!.textColor = Colors.getInstance.gray4
        
        self.addSubview(lbl_cafe_name!)
        lbl_cafe_name!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_cafe_name!.topAnchor.constraint(equalTo: shadow_subview.bottomAnchor,constant: 12).isActive = true
        lbl_cafe_name!.sizeToFit()
        
        
        lbl_adress = MyLabel()
        lbl_adress!.font = Fonts.getInstance.font_reg_xxxs
        lbl_adress!.textColor = Colors.getInstance.gray2
        lbl_adress?.textAlignment = .center
        lbl_adress?.text = restaraunt!.adress
        lbl_adress!.numberOfLines = 1
        
        self.addSubview(lbl_adress!)
        lbl_adress!.topAnchor.constraint(equalTo: lbl_cafe_name!.bottomAnchor, constant: 2).isActive = true
        lbl_adress!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_adress!.layoutIfNeeded()
        
        rating_view = RatingView(rating: restaraunt!.rating, can_touch: false,width: 18.0,distance: 1.0)
        self.addSubview(rating_view!)
        
        rating_view!.widthAnchor.constraint(equalToConstant: CGFloat(rating_view!.get_sized_width())).isActive = true
        rating_view!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rating_view!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        rating_view!.topAnchor.constraint(equalTo: lbl_adress!.bottomAnchor, constant: 10).isActive = true
        rating_view!.layoutIfNeeded()
        
        
        let ic_distance = FawLabel()
        ic_distance.textColor = Colors.getInstance.gray3
        ic_distance.text = FawStrings.locationArrow
        ic_distance.font = Fonts.getInstance.font_faw_light_s
        
        self.addSubview(ic_distance)
        ic_distance.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        ic_distance.centerYAnchor.constraint(equalTo: rating_view!.centerYAnchor).isActive = true
        ic_distance.sizeToFit()
        ic_distance.layoutIfNeeded()
        
        
        
        lbl_distance = MyLabel()
        lbl_distance!.textColor = Colors.getInstance.gray3
        lbl_distance!.font = Fonts.getInstance.font_semi_xxxs
        lbl_distance!.text = "\(Int.random(in: 112..<470)) м"
        
        self.addSubview(lbl_distance!)
        lbl_distance!.leftAnchor.constraint(equalTo: ic_distance.rightAnchor, constant: 8).isActive = true
        lbl_distance!.centerYAnchor.constraint(equalTo: ic_distance.centerYAnchor).isActive = true
        lbl_distance!.sizeToFit()
        lbl_distance!.layoutIfNeeded()
        
        
        lbl_description = MyLabel()
        lbl_description!.textColor = Colors.getInstance.gray3
        lbl_description!.text = FawStrings.locationArrow
        lbl_description!.font = Fonts.getInstance.font_reg_tiny
        lbl_description!.text = restaraunt!.desc
        lbl_description!.numberOfLines = 0
        
        self.addSubview(lbl_description!)
        lbl_description!.topAnchor.constraint(equalTo: rating_view!.bottomAnchor, constant: 10).isActive = true
        lbl_description!.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        lbl_description!.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        lbl_description!.sizeToFit()
        lbl_description!.layoutIfNeeded()
        
        
        let ic_time = FawLabel()
        ic_time.textColor = Colors.getInstance.gray3
        ic_time.text = FawStrings.clockO
        ic_time.font = Fonts.getInstance.font_faw_light_s
        
        self.addSubview(ic_time)
        ic_time.topAnchor.constraint(equalTo: lbl_description!.bottomAnchor, constant: 20).isActive = true
        ic_time.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ic_time.sizeToFit()
        ic_time.layoutIfNeeded()
        
        
        
        lbl_time = MyLabel()
        lbl_time!.textColor = Colors.getInstance.gray3
        lbl_time!.font = Fonts.getInstance.font_semi_xxxs
        lbl_time!.text = restaraunt!.get_work_hours_string()
        
        self.addSubview(lbl_time!)
        lbl_time!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_time!.topAnchor.constraint(equalTo: ic_time.bottomAnchor,constant:4).isActive = true
        lbl_time!.sizeToFit()
        lbl_time!.layoutIfNeeded()
        
        
        
        btn_to_restaraunt = BtnOrange()
        btn_to_restaraunt!.setTitle("Перейти", for: .normal)
        btn_to_restaraunt!.layer.cornerRadius = 4
        
        self.addSubview(btn_to_restaraunt!)
        btn_to_restaraunt!.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        btn_to_restaraunt!.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        btn_to_restaraunt!.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn_to_restaraunt!.topAnchor.constraint(equalTo: lbl_time!.bottomAnchor, constant: 18).isActive = true
        btn_to_restaraunt!.layoutIfNeeded()
        
    }
}
