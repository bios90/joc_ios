import Foundation
import UIKit


class VFirst : UIView
{
    var et_phone : EtUnderline?
    var et_password:EtUnderline?
    var btn_login:BtnOrange?
    var lbl_forgot_pass:MyLabel?
    var lbl_register:MyLabel?
    
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
        
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        
        
        self.layoutIfNeeded()
        var minus_height = (self.frame.height/2)+80
        minus_height *= -1
    
        
        self.addSubview(logo)
        logo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 160).isActive = true
        logo.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -160).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logo.layoutIfNeeded()
        
        
        
        et_phone = EtUnderline()
        et_phone!.translatesAutoresizingMaskIntoConstraints = false
        et_phone!.font = Fonts.getInstance.font_reg_s
        et_phone!.set_hint(text: "Телефон...", color: Colors.getInstance.white50)
        et_phone!.keyboardType = .phonePad
        
     
        self.addSubview(et_phone!)
        et_phone!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_phone!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_phone!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_phone!.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 80).isActive = true
        et_phone!.layoutIfNeeded()
        
        
        et_password = EtUnderline()
        et_password!.translatesAutoresizingMaskIntoConstraints = false
        et_password!.font = Fonts.getInstance.font_reg_s
        et_password!.set_hint(text: "Пароль...", color: Colors.getInstance.white50)
    
        self.addSubview(et_password!)
        et_password!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        et_password!.heightAnchor.constraint(equalToConstant: 42).isActive = true
        et_password!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        et_password!.topAnchor.constraint(equalTo: et_phone!.bottomAnchor,constant: 20).isActive = true
        et_password!.layoutIfNeeded()
        
        
        lbl_forgot_pass = MyLabel()
        lbl_forgot_pass?.text = "Забыли пароль?"
        lbl_forgot_pass!.translatesAutoresizingMaskIntoConstraints = false
        lbl_forgot_pass!.font = Fonts.getInstance.font_reg_xxs
        lbl_forgot_pass!.textColor = Colors.getInstance.white
        lbl_forgot_pass!.textAlignment = .right
        lbl_forgot_pass!.numberOfLines = 0
        
        self.addSubview(lbl_forgot_pass!)
        lbl_forgot_pass!.rightAnchor.constraint(equalTo: et_password!.rightAnchor).isActive = true
        lbl_forgot_pass!.topAnchor.constraint(equalTo: et_password!.bottomAnchor,constant: 8).isActive = true
        self.layoutIfNeeded()
        
        
        btn_login = BtnOrange()
        btn_login?.setTitle("Войти", for: .normal)
        
        self.addSubview(btn_login!)
        btn_login!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn_login!.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn_login!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btn_login!.topAnchor.constraint(equalTo: et_password!.bottomAnchor,constant: 56).isActive = true
        btn_login!.layoutIfNeeded()
        
        
        lbl_register = MyLabel()
        lbl_register!.text = "Регистрация"
        lbl_register!.translatesAutoresizingMaskIntoConstraints = false
        lbl_register!.font = Fonts.getInstance.font_bold_s
        lbl_register!.textColor = Colors.getInstance.white
        lbl_register!.textAlignment = .center
        lbl_register!.numberOfLines = 0
        
        self.addSubview(lbl_register!)
        lbl_register!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_register!.topAnchor.constraint(equalTo: btn_login!.bottomAnchor, constant: 20).isActive = true
        lbl_register!.sizeToFit()
        self.layoutIfNeeded()
    }
    
    override func draw(_ rect: CGRect) {
        btn_login!.layer.cornerRadius = btn_login!.frame.height/2
    }
}
