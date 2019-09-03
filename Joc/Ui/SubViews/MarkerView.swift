import Foundation
import UIKit

class MarkerView : UIView
{
    var lbl_text:MyLabel?
    var restaraunt:Model_Restaraunt?
    
    func customInit()
    {
        let img_bg = UIImageView()
        img_bg.image = UIImage(named: "marker")
        img_bg.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(img_bg)
        img_bg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        img_bg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        img_bg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img_bg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        img_bg.layoutIfNeeded()
        
        lbl_text = MyLabel()
        lbl_text!.textColor = Colors.getInstance.white
        lbl_text!.font = Fonts.getInstance.font_reg_xxs
        lbl_text!.text = restaraunt!.name
        lbl_text!.textAlignment = .center
        lbl_text!.numberOfLines = 1
        
        self.addSubview(lbl_text!)
        lbl_text!.topAnchor.constraint(equalTo: self.topAnchor,constant: 9).isActive = true
        lbl_text!.leftAnchor.constraint(equalTo: self.leftAnchor,constant:8).isActive = true
        lbl_text!.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-8).isActive = true
        lbl_text?.sizeToFit()
    }
    
    init(restaraunt:Model_Restaraunt)
    {
        self.restaraunt = restaraunt
        let rect = CGRect(x: 0, y: 0, width: 112, height: 41)
        super.init(frame:rect)
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
