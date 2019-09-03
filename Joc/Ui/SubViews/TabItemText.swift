import Foundation
import UIKit

class TabItemText : UITabBarItem
{
    init(text:String)
    {
        super.init()
        self.title = text
        self.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        setTitleTextAttributes([.font: Fonts.getInstance.font_reg_xs], for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
