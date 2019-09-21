import Foundation
import UIKit

class LaProfileExitdialog:UIView
{
    var btn_cancel:UIButton?
    var btn_exit:UIButton?
    
    var clickExit : (() -> Void)?
    var clickCancel : (() -> Void)?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init ()
    {
        super.init(frame: CGRect.zero)
        customInit()
    }
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        
        btn_cancel = UIButton()
        btn_cancel!.titleLabel!.font = Fonts.getInstance.font_bold_s
        btn_cancel!.setTitle("Отмена", for: .normal)
        btn_cancel!.layer.cornerRadius = 4
        btn_cancel!.setTitleColor(Colors.getInstance.green, for: .normal)
        btn_cancel!.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        self.addSubview(btn_cancel!)
        btn_cancel!.leftToSuperview(offset:16)
        btn_cancel!.rightToSuperview(offset:-16)
        btn_cancel!.bottomToSuperview(offset:-16,usingSafeArea: true)
        btn_cancel?.height(48)
        
        
        btn_exit = UIButton()
        btn_exit!.titleLabel!.font = Fonts.getInstance.font_bold_s
        btn_exit!.setTitle("Выйти", for: .normal)
        btn_exit!.setTitleColor(Colors.getInstance.red, for: .normal)
        btn_exit!.layer.cornerRadius = 4
        btn_exit!.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        self.addSubview(btn_exit!)
        btn_exit!.leftToSuperview(offset:16)
        btn_exit!.rightToSuperview(offset:-16)
        btn_exit!.bottomToTop(of: btn_cancel!,offset:-8)
        btn_exit!.height(48)
        
        btn_cancel!.addTarget(self, action: #selector(self.pressedCancel), for: .touchUpInside)
        btn_exit!.addTarget(self, action: #selector(self.pressedExit), for: .touchUpInside)
    }
    
    @objc func pressedCancel()
    {
        clickCancel?()
    }
    
    @objc func pressedExit()
    {
        clickExit?()
    }
    
    
}
