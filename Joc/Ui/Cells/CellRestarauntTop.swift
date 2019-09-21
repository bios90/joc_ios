import UIKit

class CellRestarauntTop: UICollectionViewCell
{
    var restaraunt:Model_Restaraunt?
    static let cell_name = "CellRestarauntTop"
    var click : (() -> Void)?
    
    var lbl_name:MyLabel?
    var rating_view:RatingView?
    var img_logo:UIImageView?
    var lbl_desc:UITextView?
    var lbl_work_hours:MyLabel?
    var lbl_adress:MyLabel?
    var lbl_distance:MyLabel?
    
    lazy var width: NSLayoutConstraint =
        {
            let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
            width.isActive = true
            return width
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame:.zero)
    }
    
    func bindRestaraunt(restaunt:Model_Restaraunt)
    {
        lbl_name = MyLabel()
        lbl_name!.font = Fonts.getInstance.font_bold_m
        lbl_name!.textColor = Colors.getInstance.white
        lbl_name!.text = restaunt.name
        
        let padding_top:CGFloat = UIDevice.current.status_bar_height+16
        
        
        self.contentView.addSubview(lbl_name!)
        lbl_name!.setAnchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: padding_top, paddingLeft: 16, paddingBottom: 0, paddingRight: 16)
        lbl_name!.sizeToFit()
        
        
        rating_view = RatingView(rating: restaunt.rating, can_touch: false, width: 15, distance: 1,white:true)
        self.contentView.addSubview(rating_view!)
        rating_view!.setAnchor(top: lbl_name!.bottomAnchor, left: lbl_name!.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width:CGFloat(rating_view!.get_sized_width()),height: 15)
        
        
        let shadow_subview = UIView()
        shadow_subview.add_light_shadow()
        
        self.contentView.addSubview(shadow_subview)
        shadow_subview.setAnchor(top: self.topAnchor , left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: padding_top, paddingLeft: 0, paddingBottom: 0, paddingRight: 16,width: 80,height: 80)
        
        img_logo = CircleImage()
        img_logo!.image = UIImage(named: restaunt.logo!)
        self.contentView.addSubview(img_logo!)
        img_logo?.setAnchor(top: shadow_subview.topAnchor, left: shadow_subview.leftAnchor, bottom: shadow_subview.bottomAnchor, right: shadow_subview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        lbl_desc = UITextView()
        lbl_desc!.text = restaunt.desc!
        lbl_desc!.font = Fonts.getInstance.font_reg_xxs
        lbl_desc!.backgroundColor = .clear
        lbl_desc!.textColor = .white
        
        self.contentView.addSubview(lbl_desc!)
        lbl_desc!.setAnchor(top: rating_view?.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: self.contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 13.5, paddingBottom: 0, paddingRight: 13.5,width: 0,height: 0)
        let size = lbl_desc!.contentSize
        lbl_desc!.heightAnchor.constraint(equalToConstant: size.height+20).isActive = true

        
        
        let x = UIScreen.main.bounds.width-16-80
        let imageFrame = UIBezierPath(roundedRect: CGRect.init(x: x, y: -60, width: 80, height: 80), cornerRadius:20)
        lbl_desc!.textContainer.exclusionPaths = [imageFrame]
        
        
        
        let ic_clock = FawLabel()
        ic_clock.font = Fonts.getInstance.font_faw_light_xs
        ic_clock.textColor = Colors.getInstance.white
        ic_clock.text = FawStrings.clockO
        self.contentView.addSubview(ic_clock)
        ic_clock.setAnchor(top: lbl_desc!.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 6, paddingBottom: 0, paddingRight: 0,width: 16,height: 16)
        
        
        lbl_work_hours = MyLabel()
        lbl_work_hours!.textColor = Colors.getInstance.white
        lbl_work_hours!.text = restaunt.get_work_hours_string()
        lbl_work_hours!.font = Fonts.getInstance.font_semi_xxxs
        self.contentView.addSubview(lbl_work_hours!)
        lbl_work_hours!.setAnchor(top: nil, left: ic_clock.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: ic_clock.centerYAnchor, paddingTop: 0, paddingLeft: 6, paddingBottom: 0, paddingRight: 0)
        lbl_work_hours?.sizeToFit()
        
        
        lbl_adress = MyLabel()
        lbl_adress!.textColor = Colors.getInstance.white70
        lbl_adress!.text = restaunt.adress!
        lbl_adress!.font = Fonts.getInstance.font_reg_xxs
        self.contentView.addSubview(lbl_adress!)
        lbl_adress!.setAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: self.contentView.centerXAnchor, centerY: ic_clock.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        lbl_adress!.sizeToFit()
        
        
        lbl_distance = MyLabel()
        lbl_distance!.textColor = Colors.getInstance.white
        lbl_distance!.text = "\(Int.random(in: 100..<240)) м"
        lbl_distance!.font = Fonts.getInstance.font_semi_xxxs
        self.addSubview(lbl_distance!)
        lbl_distance?.setAnchor(top: nil, left: nil, bottom: nil, right: self.contentView.rightAnchor, centerX: nil, centerY: ic_clock.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10)
        
        
        let ic_location = FawLabel()
        ic_location.font = Fonts.getInstance.font_faw_light_xs
        ic_location.textColor = Colors.getInstance.white
        ic_location.text = FawStrings.locationArrow
        self.addSubview(ic_location)
        ic_location.setAnchor(top: nil, left: nil, bottom: nil, right: lbl_distance!.leftAnchor, centerX: nil, centerY: ic_clock.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 6,width: 16,height: 16)
        
        
        self.contentView.resize_to_fit_vertical(padding_bottom: 10)
        
    }
    
    override func draw(_ rect: CGRect) {
        self.contentView.make_gradient(grad_layer: Colors.getInstance.getOrangeGradient(horizontal: true))
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
    {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }

    
}
