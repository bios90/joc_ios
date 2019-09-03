import Foundation
import UIKit

class TabItemFaw : UITabBarItem
{
    init(faw_text:String)
    {
        super.init()
        self.title = faw_text
        self.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        
        setTitleTextAttributes([.font: Fonts.getInstance.font_faw_light_m], for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
