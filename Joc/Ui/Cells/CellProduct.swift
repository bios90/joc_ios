
import UIKit

protocol ProductsListener
{
    func clickedProductCard(prdouct:Model_Product)
}

class CellProduct: UICollectionViewCell
{
    var product:Model_Product?
    static let cell_name = "CellProduct"
    var click : (() -> Void)?
    var productView:UIView?
    private var darkerView:UIView?
    
    lazy var width: NSLayoutConstraint =
        {
            let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width-20)
            width.isActive = true
            return width
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame:.zero)
    }
    
    func bindProduct(product:Model_Product)
    {
        productView = LaProduct(product: product)
        self.contentView.addSubview(productView!)
        productView!.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 3, paddingLeft: 10, paddingBottom: 0, paddingRight: 10,width: 0,height: 100)
        productView?.add_light_shadow()
        
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(tg)
        contentView.clipsToBounds = true
        contentView.remove_child_clicks()
        
//        let touchRecognizer = UILongPressGestureRecognizer(target:self, action: #selector(pressed))
//        touchRecognizer.minimumPressDuration = 0.03
//        contentView.addGestureRecognizer(touchRecognizer)
//        contentView.isUserInteractionEnabled = true
//        contentView.clipsToBounds = true
       
        contentView.bottomAnchor.constraint(equalTo: productView!.bottomAnchor, constant: 3).isActive = true
    }
    
    @objc func pressed(gesture: UILongPressGestureRecognizer)
    {
        click?()
//        if gesture.state == .began
//        {
//            self.addDarkerView()
//        }
//        else if gesture.state == .ended || gesture.state == .cancelled
//        {
//            self.deleteDarkerView()
//            let touchPoint = gesture.location(in: self)
//
//            let x = touchPoint.x
//            let y = touchPoint.y
//
//            if((x < self.frame.width && x > 0) && (y < self.frame.height && y > 0))
//            {
//                click?()
//            }
//        }
    }
    
    func addDarkerView()
    {
        darkerView = UIView()
        darkerView!.tag = 9999999
        darkerView!.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        productView!.addSubview(darkerView!)
        darkerView!.setAnchor(top: productView!.topAnchor, left: productView!.leftAnchor, bottom: productView!.bottomAnchor, right: productView!.rightAnchor, centerX: nil, centerY: nil
        , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func deleteDarkerView()
    {
        if let viewWithTag = productView!.viewWithTag(9999999)
        {
            viewWithTag.removeFromSuperview()
        }
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
