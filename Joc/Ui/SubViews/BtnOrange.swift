import Foundation
import UIKit

class BtnOrange: UIButton
{
    var click : (() -> Void)?
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layoutIfNeeded()
        self.titleLabel!.font = Fonts.getInstance.font_bold_s
        
        addTarget(self, action: #selector(self.btnPressed), for: .touchUpInside)
    }
    
    override func draw(_ rect: CGRect) {
        self.make_gradient(grad_layer: Colors.getInstance.getOrangeGradient(horizontal: true))
        self.clipsToBounds = true
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
    
    @objc func btnPressed()
    {
        click?()
    }
}
