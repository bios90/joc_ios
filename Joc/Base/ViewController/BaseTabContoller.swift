import Foundation
import UIKit
import SwipeableTabBarController

class BaseTabController: UITabBarController
{
    var navigationManager:NavigationManager?
    var messagesManager:MessagesManager?
    let realmHelper = RealmHelper()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationManager = NavigationManager(contoller: self)
        messagesManager = MessagesManager(contoller: self)
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.tabBar.barTintColor = Colors.getInstance.white
        self.tabBar.isTranslucent = false
        
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowColor = Colors.getInstance.gray2.cgColor
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -2.0)
        self.tabBar.layer.shadowRadius = 10
        
    }
}
