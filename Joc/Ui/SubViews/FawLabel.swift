import Foundation
import UIKit

class FawLabel:UILabel
{
    var click : (() -> Void)?
    var is_light : Bool = false
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        if(is_light)
        {
            self.font = Fonts.getInstance.font_faw_m
        }else
        {
            self.font = Fonts.getInstance.font_faw_light_m
        }
        
        self.textAlignment = .center
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    @objc func pressed()
    {
        click?()
    }
    
    init(is_light:Bool)
    {
        super.init(frame: CGRect())
        self.is_light = is_light
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
