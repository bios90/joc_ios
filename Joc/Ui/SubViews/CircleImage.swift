import Foundation
import UIKit

class CircleImage : UIImageView
{
    var click : (() -> Void)?
    
    var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat?

    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    override func layoutSubviews()
    {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
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
}
