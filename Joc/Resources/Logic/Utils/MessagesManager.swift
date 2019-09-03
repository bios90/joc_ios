import Foundation
import UIKit
import SwiftEntryKit

class MessagesManager
{
    let viewController:UIViewController
    
    init(contoller:UIViewController)
    {
        self.viewController = contoller
    }
    
    func showRedAlerter(text:String)
    {
        let view = LaRedAlerter(text: text,faw_text: nil)
        let lbl_width = viewController.view!.frame.width - 76
        view.lbl_text?.widthAnchor.constraint(equalToConstant: lbl_width).isActive = true
        view.lbl_text!.layoutIfNeeded()
        view.lbl_text!.sizeToFit()
        
        let message_height = view.lbl_text!.frame.height+84
        view.heightAnchor.constraint(equalToConstant: message_height).isActive = true
        
        
        var attributes = EKAttributes()
        
        attributes.name = "Alerter_Red"
        attributes.windowLevel = .alerts
        attributes.position = .top
        attributes.displayDuration = 4
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 1)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.statusBar = .hidden
        attributes.positionConstraints.verticalOffset = -44
        
        SwiftEntryKit.display(entry: view, using: attributes)
    }
    
    func showGreenAlerter(text:String)
    {
        let view = LaGreenAlerter(text: text,faw_text: nil)
        let lbl_width = viewController.view!.frame.width - 76
        view.lbl_text?.widthAnchor.constraint(equalToConstant: lbl_width).isActive = true
        view.lbl_text!.layoutIfNeeded()
        view.lbl_text!.sizeToFit()
        
        let message_height = view.lbl_text!.frame.height+84
        view.heightAnchor.constraint(equalToConstant: message_height).isActive = true
        
        
        var attributes = EKAttributes()
        
        attributes.name = "Alerter_Green"
        attributes.windowLevel = .alerts
        attributes.position = .top
        attributes.displayDuration = 4
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 1)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.statusBar = .hidden
        attributes.positionConstraints.verticalOffset = -44
        
        SwiftEntryKit.display(entry: view, using: attributes)
    }
    
    func showOrderDialog(order:Model_Order,ok_click: (() -> Void)?)
    {
        let view = LaOrderDialog(order: order)
        view.resize_to_fit_vertical(padding_bottom: 20)
        
        view.btn_repeat!.click =
            {
                print("clicked sdjfnjksfngdf")
                ok_click?()
        }
        
        var attributes = EKAttributes()
        attributes.name = "Order_Dialog"
        attributes.windowLevel = .alerts
        attributes.position = .bottom
        attributes.displayDuration = 99
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .dismiss
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 0.92)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.statusBar = .inferred
        attributes.positionConstraints.verticalOffset = 80
        attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.5, alpha: 0.5)))
        
        SwiftEntryKit.display(entry: view, using: attributes)
    }
    
    func show_restaraunt_dialog(restaraunt:Model_Restaraunt,ok_click: (() -> Void)?)
    {
        let view = LaRestDialog(restaunt: restaraunt)
        view.resize_to_fit_vertical(padding_bottom: 40)
        
        view.btn_to_restaraunt!.click =
            {
                SwiftEntryKit.dismiss()
                ok_click?()
        }
        
        var attributes = EKAttributes()
        attributes.name = "Restaraunt_dialog"
        attributes.windowLevel = .alerts
        attributes.position = .bottom
        attributes.displayDuration = 99
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .dismiss
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 1)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.statusBar = .inferred
        attributes.positionConstraints.verticalOffset = -34
        attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.5, alpha: 0.5)))
        
        SwiftEntryKit.display(entry: view, using: attributes)
    }
    
    func show_product_dialog(product:Model_Product,ok_click: (() -> Void))
    {
        let view = LaProductDialog(product: product)
        view.resize_to_fit_vertical(padding_bottom: 40)
    
        
        var attributes = EKAttributes()
        attributes.name = "Product_dialog"
        attributes.windowLevel = .alerts
        attributes.position = .bottom
        attributes.displayDuration = 99
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .dismiss
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 1)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        attributes.statusBar = .inferred
//        attributes.positionConstraints.verticalOffset = -34
        attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.5, alpha: 0.5)))
        
        SwiftEntryKit.display(entry: view, using: attributes)
    }
}
