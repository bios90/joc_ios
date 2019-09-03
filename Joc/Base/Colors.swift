import Foundation
import UIKit

class Colors : NSObject
{
    static let getInstance = Colors()
    
    let white = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    let white50 = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
    let white70 = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
    let orange = UIColor.init(displayP3Red: 249/255, green: 73/255, blue: 18/255, alpha: 1)
    
    let gray0 = UIColor.init(displayP3Red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    let gray1 = UIColor.init(displayP3Red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    let gray2 = UIColor.init(displayP3Red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
    let gray3 = UIColor.init(displayP3Red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
    let gray4 = UIColor.init(displayP3Red: 78/255, green: 78/255, blue: 78/255, alpha: 1)
    let gray5 = UIColor.init(displayP3Red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    
    let green = UIColor.init(displayP3Red: 42/255, green: 179/255, blue: 152/255, alpha: 1)
    let green_dark = UIColor.init(displayP3Red: 17/255, green: 153/255, blue: 142/255, alpha: 1)
    let green_light = UIColor.init(displayP3Red: 67/255, green: 206/255, blue: 162/255, alpha: 1)
    
    let red = UIColor.init(displayP3Red: 245/255, green: 55/255, blue: 5/255, alpha: 1)
    let red_dark = UIColor.init(displayP3Red: 245/255, green: 28/255, blue: 28/255, alpha: 1)
    let red_light = UIColor.init(displayP3Red: 226/255, green: 47/255, blue: 73/255, alpha: 1)
    
    
    
    func getGrayOrderGradient()->CAGradientLayer
    {
        let start = UIColor.init(displayP3Red: 102/255, green: 91/255, blue: 91/255, alpha: 0.95).cgColor
        let end = UIColor.init(displayP3Red: 179/255, green: 169/255, blue: 169/255, alpha: 0.92).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [start,end]
        gradientLayer.locations = [0, 1]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        return gradientLayer
    }
    
    func getGreenNotifyGradient()->CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [green_dark.cgColor,green_light.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        return gradientLayer
    }
    
    
    func getRedNotifyGradient()->CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [red_dark.cgColor,red_light.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        return gradientLayer
    }
    
    
    func getOrangeGradient(horizontal:Bool)->CAGradientLayer
    {
        let orange = UIColor(displayP3Red: 254/255, green: 134/255, blue: 5/255, alpha: 1)
        return getGradient(color1: red_dark , color2: orange, horizontal: horizontal)
    }
    

    func getGradient(color1:UIColor,color2:UIColor, horizontal:Bool)->CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0, 1]
        if(horizontal)
        {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        }
        else
        {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        }

        return gradientLayer
    }
}
