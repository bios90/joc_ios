import Foundation
import UIKit


class VRegister : UIView
{
    var et_first_name:EtUnderline?
    var et_last_name:EtUnderline?
    var et_phone:EtUnderline?
    var et_password1:EtUnderline?
    var et_password2:EtUnderline?
    var btn_register:BtnOrange?
    var lbl_cancel : MyLabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        let bg = UIImageView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.image = UIImage(named: "bg")
        
        self.addSubview(bg)
        bg.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bg.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        bg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bg.layoutIfNeeded()
        
        et_phone = EtUnderline()
        et_phone!.font = Fonts.getInstance.font_reg_s
        et_phone!.set_hint(text: "Телефон...", color: Colors.getInstance.white50)
        et_phone!.keyboardType = .phonePad
        let toolbar = StaticViews.getNumberToolbar()
        toolbar.items![0].target = self
        toolbar.items![0].action = #selector(self.clikedCancel)
        
        toolbar.items![2].target = self
        toolbar.items![2].action = #selector(self.clikedDone)
        
        et_phone!.inputAccessoryView = toolbar
        
        self.addSubview(et_phone!)
        et_phone!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_phone!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_phone!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_phone!.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        et_phone!.layoutIfNeeded()
        
        
        et_first_name = EtUnderline()
        et_first_name!.font = Fonts.getInstance.font_reg_s
        et_first_name!.set_hint(text: "Имя...", color: Colors.getInstance.white50)
        
        self.addSubview(et_first_name!)
        et_first_name!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_first_name!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_first_name!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_first_name!.bottomAnchor.constraint(equalTo: et_phone!.topAnchor,constant: -20).isActive = true
        et_first_name!.layoutIfNeeded()
        
        
        et_last_name = EtUnderline()
        et_last_name!.font = Fonts.getInstance.font_reg_s
        et_last_name!.set_hint(text: "Фамилия...", color: Colors.getInstance.white50)
        
        self.addSubview(et_last_name!)
        et_last_name!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_last_name!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_last_name!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_last_name!.bottomAnchor.constraint(equalTo: et_first_name!.topAnchor,constant: -20).isActive = true
        et_last_name!.layoutIfNeeded()
        
        
        
        et_password1 = EtUnderline()
        et_password1!.font = Fonts.getInstance.font_reg_s
        et_password1!.set_hint(text: "Пароль...", color: Colors.getInstance.white50)
        
        self.addSubview(et_password1!)
        et_password1!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_password1!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_password1!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_password1!.topAnchor.constraint(equalTo: et_phone!.bottomAnchor,constant: 20).isActive = true
        et_password1!.layoutIfNeeded()
        
        
        
        et_password2 = EtUnderline()
        et_password2!.font = Fonts.getInstance.font_reg_s
        et_password2!.set_hint(text: "Повторите пароль...", color: Colors.getInstance.white50)
        
        self.addSubview(et_password2!)
        et_password2!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_password2!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_password2!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_password2!.topAnchor.constraint(equalTo: et_password1!.bottomAnchor,constant: 20).isActive = true
        et_password2!.layoutIfNeeded()
        
        
        btn_register = BtnOrange()
        btn_register?.setTitle("Регистрация", for: .normal)
        
        self.addSubview(btn_register!)
        btn_register!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn_register!.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn_register!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btn_register!.topAnchor.constraint(equalTo: et_password2!.bottomAnchor,constant: 42).isActive = true
        btn_register!.layoutIfNeeded()
        
        
        lbl_cancel = MyLabel()
        lbl_cancel!.text = "Отмена"
        lbl_cancel!.translatesAutoresizingMaskIntoConstraints = false
        lbl_cancel!.font = Fonts.getInstance.font_bold_s
        lbl_cancel!.textColor = Colors.getInstance.white
        lbl_cancel!.textAlignment = .center
        lbl_cancel!.numberOfLines = 0
        
        self.addSubview(lbl_cancel!)
        lbl_cancel!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_cancel!.topAnchor.constraint(equalTo: btn_register!.bottomAnchor, constant: 20).isActive = true
        lbl_cancel!.sizeToFit()
        self.layoutIfNeeded()
    }
    
    override func draw(_ rect: CGRect)
    {
        btn_register!.layer.cornerRadius = btn_register!.frame.height/2
    }
    
    @objc func clikedDone ()
    {
        et_phone!.resignFirstResponder()
    }
    
    @objc func clikedCancel ()
    {
        et_phone!.resignFirstResponder()
        et_phone!.text=""
    }
}
