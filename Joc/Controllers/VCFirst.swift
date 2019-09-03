import Foundation
import UIKit
import SwiftEntryKit

class VCFirst: BaseViewContoller
{
    var viewFirst:VFirst? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
        check_for_login()
    }
    
    func loadViews()
    {
        self.navigationController!.navigationBar.isHidden = true
        
        viewFirst = VFirst()
        self.view.addSubview(viewFirst!)
        viewFirst!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewFirst!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        viewFirst!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFirst!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFirst?.layoutIfNeeded()
        
        viewFirst!.btn_login!.click =
            {
                self.navigationManager?.toVcMain()
//                self.make_fake_login()
        }
        
        viewFirst!.lbl_register!.click =
            {
                let v = VCRegister()
                self.navigationController?.pushViewController(v, animated: true)
        }
        
    }
    
    func make_fake_login()
    {
        let phone = viewFirst!.et_phone?.get_nullable_text()
        let password = viewFirst!.et_password?.get_nullable_text()
        
        let user = realmHelper.make_fake_login(phone: phone!, password: password!)
        
        if(user == nil)
        {
            messagesManager?.showRedAlerter(text: "Erororor")
        }else
        {
            messagesManager?.showGreenAlerter(text: "Successs")
        }
    }
    
    func check_for_login()
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        viewFirst?.et_phone!.resignFirstResponder()
        viewFirst?.et_password!.resignFirstResponder()
        super.touchesBegan(touches , with:event)
    }
    

}
