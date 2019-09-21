import Foundation
import UIKit

class StaticViews
{
    static func getNumberToolbar()->UIToolbar
    {
        let numberToolbar: UIToolbar = UIToolbar()
        
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        
        let btnLeft = UIBarButtonItem(title: "Отмена", style: .plain , target: self, action:nil)
        btnLeft.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.getInstance.white], for: .normal)
        btnLeft.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.getInstance.white], for: .highlighted)
        
        
        let btnRight = UIBarButtonItem(title: "Готово", style: .plain , target: self, action:nil)
        btnRight.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.getInstance.white], for: .normal)
        btnRight.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.getInstance.white], for: .highlighted)
        
        numberToolbar.items=[
            btnLeft,
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            btnRight
        ]
        
        numberToolbar.sizeToFit()
        
        return numberToolbar
    }
}
