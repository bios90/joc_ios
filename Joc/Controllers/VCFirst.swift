import Foundation
import UIKit
import SwiftEntryKit

class VCFirst: BaseViewContoller, UITextFieldDelegate
{
    var viewFirst:VFirst? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(realmHelper.getLoggedUser() != nil)
        {
            self.navigationManager?.toVcMain(animated: false)
        }
        
        loadViews()
    }
    
    func loadViews()
    {
        self.navigationController?.navigationBar.isHidden = true
        
        viewFirst = VFirst()
        self.view.addSubview(viewFirst!)
        viewFirst!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewFirst!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        viewFirst!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFirst!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFirst?.layoutIfNeeded()
        
        viewFirst!.btn_login!.click =
            {
                self.make_fake_login()
        }
        
        viewFirst!.lbl_register!.click =
            {
                let v = VCRegister()
                self.navigationController?.pushViewController(v, animated: true)
        }
        
        viewFirst!.et_phone!.delegate = self
        viewFirst!.et_password!.delegate = self
        
    }
    
    func make_fake_login()
    {
        let phone = viewFirst!.et_phone?.get_nullable_text()
        let password = viewFirst!.et_password?.get_nullable_text()
        
        if(phone == nil || password == nil)
        {
            messagesManager?.showRedAlerter(text: "Ошибка входа")
            return
        }
        
        if(phone == "12345678" && password == "12345678")
        {
            realmHelper.saveDymmyUser()
            self.navigationManager?.toVcMain()
            return
        }
        
        let user = realmHelper.make_fake_login(phone: phone!, password: password!)
        
        if(user == nil)
        {
            messagesManager?.showRedAlerter(text: "Ошибка входа")
        }else
        {
            realmHelper.save_login_user(user: user!)
            self.navigationManager?.toVcMain()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        viewFirst?.et_phone!.resignFirstResponder()
        viewFirst?.et_password!.resignFirstResponder()
        super.touchesBegan(touches , with:event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

}
