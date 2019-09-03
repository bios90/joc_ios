import Foundation
import UIKit

class MyLabel:UILabel
{
    var click : (() -> Void)?
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = Fonts.getInstance.font_reg_s
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    @objc func pressed()
    {
        click?()
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
