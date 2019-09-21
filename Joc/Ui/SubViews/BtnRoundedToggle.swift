import Foundation
import UIKit
import TinyConstraints

class BtnRoundedToggle:UIView
{
    var item : Any?
    var distance:Int?
    var isOn = false
    var lbl_text: UILabel?
    
    
    var click : (() -> Void)?
    
    func customInit()
    {
        self.layer.cornerRadius = 16
        self.layer.borderColor = Colors.getInstance.orange.cgColor
    
        lbl_text = MyLabel()
        lbl_text!.text = get_text()
        lbl_text!.font = Fonts.getInstance.font_light_xxs
        lbl_text!.textAlignment = .center
        lbl_text!.textColor = Colors.getInstance.gray3
        self.addSubview(lbl_text!)
        lbl_text!.sizeToFit()
        lbl_text!.centerInSuperview()
        lbl_text!.isUserInteractionEnabled = false
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(self.pressed))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tg)
    }
    
    func toggle()
    {
        if(isOn)
        {
            setOff()
        }
        else
        {
            setOn()
        }
    }
    
    func setOn()
    {
        self.layer.borderWidth = 1
        lbl_text!.font = Fonts.getInstance.font_reg_xxs
        lbl_text!.textColor = Colors.getInstance.orange
        isOn = true
    }
    
    func setOff()
    {
        self.layer.borderWidth = 0
        lbl_text!.font = Fonts.getInstance.font_light_xxs
        lbl_text!.textColor = Colors.getInstance.gray3
        isOn = false
    }
    
    @objc func pressed()
    {
        print("Called pressed")
        click?()
    }
    
    init(item:Any)
    {
        self.item = item
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
    
    func get_text()->String
    {
        if(item is Model_Add)
        {
            return (item as! Model_Add).name!
        }
        if(item is Model_Milk)
        {
            return (item as! Model_Milk).name!
        }
        if(item is Model_Weight)
        {
            let weight = (item as! Model_Weight).weight
            return "\(Int(weight)) мл"
        }
        if(item is String)
        {
            return (item as! String)
        }
        
        return "Unknown type"
    }
}
