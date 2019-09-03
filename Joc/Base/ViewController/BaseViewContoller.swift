import Foundation
import UIKit

class BaseViewContoller: UIViewController
{
    var navigationManager:NavigationManager?
    var messagesManager:MessagesManager?
    let realmHelper = RealmHelper()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationManager = NavigationManager(contoller: self)
        messagesManager = MessagesManager(contoller: self)
    }
}
