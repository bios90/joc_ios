import Foundation
import UIKit

extension UIDevice
{
    var modelName: String
    {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    var monobrow_screen:Bool
    {
        if(status_bar_height > 40)
        {
            return true
        }
        
        return false
    }
    
    var navbar_size:Int
    {
        if(UIDevice.current.monobrow_screen)
        {
            return 88
        }
        else
        {
            return 69
        }
    }
    
    var status_bar_height:CGFloat
    {
        print("Status bar height is \(UIApplication.shared.statusBarFrame.height)")
        return UIApplication.shared.statusBarFrame.height
    }
    
    
}


