import Foundation
import UIKit

class ShadowRoundView : UIView
{
    var click : (() -> Void)?
    
    var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat?
    var fillColor: UIColor?
    var shadow_color : UIColor?
    var shadow_radius:CGFloat?
    var shadow_offset:CGSize?
    var shadow_oppacity:Float?
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    
    @objc func pressed()
    {
        click?()
    }
    
    init()
    {
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
        
        if shadowLayer == nil
        {
            shadowLayer = CAShapeLayer()

            if(cornerRadius == nil)
            {
                cornerRadius = self.frame.height/2
            }
            
            if(fillColor == nil)
            {
                fillColor = UIColor.white
            }
            
            if(shadow_radius == nil)
            {
                shadow_radius = 5
            }
            
            if(shadow_offset == nil)
            {
                shadow_offset = CGSize(width: 0, height: 4)
            }
            
            if(shadow_oppacity == nil)
            {
                shadow_oppacity = 0.5
            }

            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius!).cgPath
            shadowLayer.fillColor = fillColor!.cgColor

            shadowLayer.shadowColor = Colors.getInstance.gray5.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = shadow_offset!
            shadowLayer.shadowOpacity = shadow_oppacity!
            shadowLayer.shadowRadius = shadow_radius!

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
