import Foundation
import UIKit
import SwipeableTabBarController

class VCMain: BaseTabController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tabBar.unselectedItemTintColor = Colors.getInstance.gray3
        self.tabBar.tintColor = Colors.getInstance.orange
        
        self.tabBar.barTintColor = Colors.getInstance.white
        self.tabBar.isTranslucent = false
        
        
        let vcProfile = VCProfile()
        vcProfile.tabBarItem = TabItemFaw(faw_text: FawStrings.user)
        
        let vcRestaraunts = VCRestaraunts()
        vcRestaraunts.tabBarItem = TabItemFaw(faw_text: FawStrings.locationArrow)
        
        let vcMap = VCMap()
        vcMap.tabBarItem = TabItemFaw(faw_text: FawStrings.globe_europe)
        
        
        let tabBarList = [vcProfile, vcMap, vcRestaraunts]
        
        viewControllers = tabBarList
        selectedIndex = 1
    }
}
