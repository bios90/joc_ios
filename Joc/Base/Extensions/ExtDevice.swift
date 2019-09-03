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
        var name = modelName
        
        return true
        
        if(name.contains("iPhone11"))
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
    
    var status_bar_heigh:CGFloat
    {
        return UIApplication.shared.statusBarFrame.height
    }
    
    
}


