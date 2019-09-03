import Foundation
import UIKit

class NavigationManager
{
    let viewController:UIViewController
    
    init(contoller:UIViewController)
    {
        self.viewController = contoller
    }
    
    func toVcFirst()
    {
        viewController.navigationController?.pushViewController(VCFirst(), animated: true)
    }
    
    func toVcRegister()
    {
        viewController.navigationController?.pushViewController(VCRegister(), animated: true)
    }
    
    func toVcMain()
    {
        viewController.navigationController!.pushViewController(VCMain(), animated: true)
    }
    
    func toVcCafe(restaraunt:Model_Restaraunt)
    {
        viewController.navigationController!.pushViewController(VCCafe(restaraunt: restaraunt), animated: true)
    }
}
