import UIKit

class LaProductDialog: UIView
{
    var product:Model_Product?
    
    var img:UIImageView?
    var la_overlay:UIView?
    var lbl_desc:UILabel?
    var lbl_name:UILabel?
    
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
        self.product = product
        super.init(frame: CGRect.zero)
        customInit()
    }
    
    func customInit()
    {
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        let top_view_height = Configs.screenWidth * 0.4
        let topview = UIView()
        self.addSubview(topview)
        topview.setAnchor(top: self.topAnchor, left: self.leftAnchor , bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 0,height: top_view_height)
        
        img = UIImageView()
        img!.contentMode = .scaleAspectFill
        img!.clipsToBounds = true
        img!.image = UIImage(named: product!.img_name!)
        img!.addToFillOther(view: topview)
        
        la_overlay = UIView()
        la_overlay!.addToFillOther(view: topview)
        
        
        lbl_desc = MyLabel()
        lbl_desc!.textColor = Colors.getInstance.white
        lbl_desc!.text = product!.desc
        lbl_desc!.font = Fonts.getInstance.font_reg_xxxs
        lbl_desc!.numberOfLines = 0
        topview.addSubview(lbl_desc!)
        lbl_desc?.setAnchor(top: nil, left: topview.leftAnchor, bottom: topview.bottomAnchor, right: topview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: 8, paddingRight: 12)
        lbl_desc?.sizeToFit()
        
        lbl_name = MyLabel()
        lbl_name!.textColor = Colors.getInstance.white
        lbl_name!.text = product!.name
        lbl_name!.font = Fonts.getInstance.font_semi_m
        topview.addSubview(lbl_name!)
        lbl_name?.setAnchor(top: nil, left: lbl_desc?.leftAnchor, bottom: lbl_desc?.topAnchor, right: lbl_desc?.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 0)
        
    }
    
    override func draw(_ rect: CGRect)
    {
        let color1 = Colors.getInstance.gray5
        let color2 = UIColor.clear
        let gradLayer = Colors.getInstance.getGradient(color1: color1, color2: color2, horizontal: false)
        
        la_overlay!.make_gradient(grad_layer: gradLayer)
    }

}
