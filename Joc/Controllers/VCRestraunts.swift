import Foundation
import UIKit
import SwipeableTabBarController

class VCRestaraunts: BaseTabController
{    
    override func viewDidLoad()
    {
        BaseNavController.getInstance?.setStatusBarColor(black:true)
        
        super.viewDidLoad()
        self.view.backgroundColor = Colors.getInstance.gray0
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.getInstance.font_semi_s], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.getInstance.font_semi_s], for: .selected)
        
        self.tabBar.unselectedItemTintColor = Colors.getInstance.gray3
        self.tabBar.tintColor = Colors.getInstance.orange
        
        self.tabBar.barTintColor = Colors.getInstance.white
//        self.tabBar.isTranslucent = false
        
        
        let vc1 = VCCafeList(by_rating:false)
        vc1.tabBarItem = TabItemText(text: "По расстоянию")
        
        let vc2 = VCCafeList(by_rating:true)
        vc2.tabBarItem = TabItemText(text: "По рейтингу")
        
        let tabBarList = [vc1, vc2]
        
        viewControllers = tabBarList
    }
    
    override func viewWillLayoutSubviews()
    {
        setNeedsStatusBarAppearanceUpdate()
        super.viewWillLayoutSubviews()
        
        var navBarHeight:CGFloat = CGFloat(UIDevice.current.navbar_size)
        
        
        tabBar.selectionIndicatorImage = createSelectionIndicator(color: Colors.getInstance.orange, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: navBarHeight), lineHeight: 1.0)
        
        
        var tabFrame:CGRect = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height:navBarHeight)
        tabFrame.origin.y = self.view.frame.origin.y
        self.tabBar.frame = tabFrame
        
        self.tabBar.isTranslucent = false
        self.tabBar.isTranslucent = true
    }
    
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint(x: 0,y :size.height - lineHeight), size: CGSize(width: size.width, height: lineHeight)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
