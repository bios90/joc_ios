import Foundation
import UIKit

class FawArrowBack
{
    static func getArrow(color:UIColor = Colors.getInstance.white)->FawLabel
    {
        var lbl = FawLabel()
        lbl.text = FawStrings.chevronLeft
        lbl.textColor = color
        lbl.font = Fonts.getInstance.font_faw_s
        
        return lbl
    }
}
