import Foundation
import UIKit

extension UITextField
{
    func set_hint(text:String,color:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
    
    func get_nullable_text()->String?
    {
        var text = self.text
        if(text == nil)
        {
            return nil
        }
        
        text = text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if(text!.count == 0)
        {
            return nil
        }
        
        return text
    }
}
