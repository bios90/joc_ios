import Foundation
import UIKit

class VCProfile: BaseViewContoller,OrderCardListener
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews()
    {
        let view_profile = VProfile()
        self.view.addSubview(view_profile)
        view_profile.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        view_profile.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        view_profile.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view_profile.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view_profile.layoutIfNeeded()
        
        let orders = RepoOrders.get_orders()
        orders.sorted(by: { $0.date! > $1.date! })
        
        view_profile.bind_orders(orders: orders,listerner: self)
    }
    
    func clicked_card(order: Model_Order)
    {
        messagesManager!.showOrderDialog(order: order,ok_click:
            {
                self.messagesManager?.showGreenAlerter(text: "Новый заказ оформлен")
        })
    }
}
