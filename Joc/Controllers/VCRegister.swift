import Foundation
import UIKit
import SwiftEntryKit

class VCRegister: BaseViewContoller,UITextFieldDelegate
{
    var viewRegister:VRegister? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews()
    {
        self.navigationController!.navigationBar.isHidden = true
        
        viewRegister = VRegister()
        self.view.addSubview(viewRegister!)
        viewRegister!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewRegister!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        viewRegister!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewRegister!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewRegister!.layoutIfNeeded()
        
        viewRegister!.et_first_name!.delegate = self
        viewRegister!.et_last_name!.delegate = self
        viewRegister!.et_phone!.delegate = self
        viewRegister!.et_password1!.delegate = self
        viewRegister?.et_password2!.delegate = self
        
        viewRegister!.lbl_cancel!.click =
            {
                self.navigationManager!.toVcFirst()
        }
        
        viewRegister!.btn_register?.click =
            {
                self.register()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        viewRegister?.et_first_name!.resignFirstResponder()
        viewRegister?.et_last_name!.resignFirstResponder()
        viewRegister?.et_phone!.resignFirstResponder()
        viewRegister?.et_password1!.resignFirstResponder()
        viewRegister?.et_password2!.resignFirstResponder()
        
        super.touchesBegan(touches , with:event)
    }
    

    func register()
    {
        let first_name = viewRegister?.et_first_name!.get_nullable_text()
        let last_name = viewRegister!.et_last_name!.get_nullable_text()
        let phone = viewRegister!.et_phone!.get_nullable_text()
        let password1 = viewRegister!.et_password1!.get_nullable_text()
        let password2 = viewRegister!.et_password2!.get_nullable_text()
        
        if(!ValidationManager.validate_register(first_name: first_name, last_name: last_name, phone: phone, password1: password1, password2: password2))
        {
            let errors = ValidationManager.get_register_error(first_name: first_name, last_name: last_name, phone: phone, password1: password1, password2: password2)
            let message = StringManager.listOfStringToSingle(strings: errors, separator: "\n")
            messagesManager?.showRedAlerter(text: message)
            return
        }
        
        if(realmHelper.check_if_phone_used(phone: phone!))
        {
            let message = "Данный телефон уже занят"
            messagesManager?.showRedAlerter(text: message)
            return
        }
        
        let user = Model_User()
        user.first_name = first_name!
        user.last_name = last_name!
        user.phone = phone!
        user.password = password1!
        
        realmHelper.save_registration_user(user: user)
        
        messagesManager?.showGreenAlerter(text: "Успешная регистрация, теперь вы можете войти в систему Joc")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            self.navigationManager?.toVcFirst()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
