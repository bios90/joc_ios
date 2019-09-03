import UIKit

class LaReply: UIView
{
    var reply:Model_Reply?
    var img_logo:UIImageView?
    var lbl_name : MyLabel?
    var lbl_date : MyLabel?
    var lbl_desc:MyLabel?
    var rating:RatingView?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (reply:Model_Reply)
    {
        super.init(frame: CGRect.zero)
        self.reply = reply
        customInit()
    }
    
    func customInit()
    {
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 4
        
        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_oppacity = 0.1
        shadow_subview.shadow_radius = 3
        
        self.addSubview(shadow_subview)
        shadow_subview.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0,width: 72,height: 72)
        
        
        img_logo = CircleImage()
        img_logo?.contentMode = .scaleAspectFill
        img_logo?.image = UIImage(named: reply!.image_name!)
        
        shadow_subview.addSubview(img_logo!)
        img_logo?.setAnchor(top: shadow_subview.topAnchor, left: shadow_subview.leftAnchor, bottom: shadow_subview.bottomAnchor, right: shadow_subview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        rating = RatingView(rating: reply!.rating, can_touch: false, width: 15, distance: 1)
        self.addSubview(rating!)
        rating?.setAnchor(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 10)
        
        
        lbl_name = MyLabel()
        lbl_name!.font = Fonts.getInstance.font_bold_s
        lbl_name!.textColor = Colors.getInstance.gray4
        lbl_name!.textAlignment = .center
        lbl_name!.text = reply?.user_name!
        self.addSubview(lbl_name!)
        lbl_name!.setAnchor(top: shadow_subview.topAnchor, left: shadow_subview.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 6, paddingBottom: 0, paddingRight: 0)
        lbl_name?.sizeToFit()
        
        
        
        
        lbl_date = MyLabel()
        lbl_date!.font = Fonts.getInstance.font_semi_xxxs
        lbl_date!.textColor = Colors.getInstance.gray2
        lbl_date!.textAlignment = .left
        lbl_date!.text = reply?.date!.fotmatToString()
        self.addSubview(lbl_date!)
        lbl_date!.setAnchor(top: lbl_name?.bottomAnchor, left: lbl_name?.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        lbl_desc = MyLabel()
        lbl_desc!.font = Fonts.getInstance.font_reg_xxxs
        lbl_desc!.textColor = Colors.getInstance.gray4
        lbl_desc!.text = reply?.text!
        lbl_desc!.numberOfLines = 0
        self.addSubview(lbl_desc!)
        lbl_desc?.setAnchor(top: lbl_date?.bottomAnchor, left: lbl_date?.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 10)
        lbl_desc?.sizeToFit()
        
        
        self.resize_to_fit_vertical(padding_bottom: 8)
        
        
    }

}
