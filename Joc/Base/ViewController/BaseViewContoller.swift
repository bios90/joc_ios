import Foundation
import UIKit

extension UIViewController {
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = style == .lightContent ? UIColor.black : .white
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}

class BaseViewContoller: UIViewController
{
    var navigationManager:NavigationManager?
    var messagesManager:MessagesManager?
    let realmHelper = RealmHelper()
    var statusColorBlack = false
    
    init(statusColorBlack: Bool = false)
    {
        super.init(nibName: nil, bundle: nil)
        self.statusColorBlack = statusColorBlack
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationManager = NavigationManager(contoller: self)
        messagesManager = MessagesManager(contoller: self)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        BaseNavController.getInstance?.setStatusBarColor(black:statusColorBlack)
    }
}
