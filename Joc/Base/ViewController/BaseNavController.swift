import Foundation
import UIKit

class BaseNavController: UINavigationController
{
    static var getInstance:BaseNavController?
    var blackStatusBar = false
    
    func setStatusBarColor(black:Bool = false)
    {
        blackStatusBar = black
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseNavController.getInstance = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        if(blackStatusBar)
        {
            return .default
        }
        else
        {
            return .lightContent
        }
    }
}
