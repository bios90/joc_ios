import Foundation
import UIKit
import SwiftEntryKit

class VCProfile: BaseViewContoller,OrderCardListener
{
    var view_profile:VProfile?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews()
    {
        view_profile = VProfile()
        self.view.addSubview(view_profile!)
        view_profile!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        view_profile!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        view_profile!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view_profile!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view_profile!.layoutIfNeeded()
        
        let orders = RepoOrders.get_orders()
        orders.sorted(by: { $0.date! > $1.date! })
        
        view_profile!.bind_orders(orders: orders,listerner: self)
        
        let user = realmHelper.getLoggedUser()!
        view_profile?.bindUser(user: user)
        
        let exitClicked =
        {
            SwiftEntryKit.dismiss()
            self.realmHelper.delete_login_user()
            self.navigationManager?.toVcFirst()
        }
        
        let cancelClicked =
        {
            SwiftEntryKit.dismiss()
        }
        
        view_profile?.lbl_edit_profile?.click =
            {
                self.messagesManager?.showExitProfileDialog(clickedExit: exitClicked, clickedCancel: cancelClicked)
        }
    }
    
    func clicked_card(order: Model_Order)
    {
        messagesManager!.showOrderDialog(order: order,ok_click:
            {
                self.messagesManager?.showGreenAlerter(text: "Новый заказ оформлен")
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BaseNavController.getInstance?.setStatusBarColor(black:false)
    }
}
