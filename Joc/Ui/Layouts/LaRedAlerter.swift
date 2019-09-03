import Foundation
import UIKit

class LaRedAlerter : UIView
{
    var text:String?
    var faw_text:String?
    var lbl_faw:FawLabel?
    var lbl_text:UILabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (text:String,faw_text:String?)
    {
        super.init(frame: CGRect(x: 8, y: 8, width: 8, height: 8))
        self.text = text
        self.faw_text = faw_text
        customInit()
    }
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if(faw_text == nil)
        {
            faw_text = FawStrings.bell
        }
        
        if(text == nil)
        {
            text = "sdfdsfg ajsdf [ pwetpoij'aslm;d "
        }
        
        lbl_text = UILabel()
        lbl_text!.translatesAutoresizingMaskIntoConstraints = false
        lbl_text!.text = text
        lbl_text!.font = Fonts.getInstance.font_reg_xs
        lbl_text!.textColor = Colors.getInstance.white
        lbl_text!.textAlignment = .left
        lbl_text?.numberOfLines = 0
        
        self.addSubview(lbl_text!)
        lbl_text!.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 64).isActive = true
        lbl_text!.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        lbl_text!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        lbl_text?.sizeToFit()
        self.layoutIfNeeded()
        
        lbl_faw = FawLabel()
        lbl_faw?.textColor = Colors.getInstance.white
        lbl_faw?.font = Fonts.getInstance.font_faw_l
        self.addSubview(lbl_faw!)
        
        lbl_faw?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        lbl_faw?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lbl_faw?.centerYAnchor.constraint(equalTo: lbl_text!.centerYAnchor).isActive = true
        lbl_faw?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        lbl_faw?.text = faw_text
    }
    
    override func draw(_ rect: CGRect)
    {
        self.make_gradient(grad_layer: Colors.getInstance.getRedNotifyGradient())
    }
}
