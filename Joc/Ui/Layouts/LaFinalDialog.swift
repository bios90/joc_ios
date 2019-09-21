import Foundation
import UIKit
import SwiftEntryKit

class LaFinalDialog:UIView
{
    var restaraunt:Model_Restaraunt?
    var sum:Double?
    
    var clickedOk:(() -> Void)?
    
    var img_logo:UIImageView?
    var lbl_name:MyLabel?
    var lbl_adress:MyLabel?
    var lbl_time:MyLabel?
    var lbl_sum:MyLabel?
    var btn_make:BtnOrange?
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (restaraunt:Model_Restaraunt,sum:Double)
    {
        self.sum = sum
        self.restaraunt = restaraunt
        super.init(frame: CGRect.zero)
        customInit()
    }
    
    func customInit()
    {
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 4
        
        let shadow_subview = ShadowRoundView()
        shadow_subview.shadow_oppacity = 0.3
        
        self.addSubview(shadow_subview)
        shadow_subview.width(80)
        shadow_subview.height(80)
        shadow_subview.leftToSuperview(offset:28)
        shadow_subview.topToSuperview(offset:16)
        
        img_logo = CircleImage()
        img_logo!.image = UIImage(named: restaraunt!.logo!)
        
        shadow_subview.addSubview(img_logo!)
        img_logo!.edgesToSuperview()
        
        lbl_name = MyLabel()
        lbl_name!.font = Fonts.getInstance.font_semi_m
        lbl_name!.textColor = Colors.getInstance.gray4
        lbl_name!.text = restaraunt!.name!
        self.addSubview(lbl_name!)
        lbl_name!.top(to: shadow_subview,offset:10)
        lbl_name!.leftToRight(of: shadow_subview,offset:20)
        lbl_name!.sizeToFit()
        
        
        lbl_adress = MyLabel()
        lbl_adress!.font = Fonts.getInstance.font_reg_xxs
        lbl_adress!.textColor = Colors.getInstance.gray2
        lbl_adress!.text = restaraunt!.adress!
        self.addSubview(lbl_adress!)
        lbl_adress!.topToBottom(of: lbl_name!,offset: 4)
        lbl_adress!.left(to: lbl_name!)
        lbl_adress!.sizeToFit()
        
        let lbl_faw_clock = FawLabel()
        lbl_faw_clock.text = FawStrings.clockO
        lbl_faw_clock.textColor = Colors.getInstance.gray3
        lbl_faw_clock.font = Fonts.getInstance.font_faw_light_s
        self.addSubview(lbl_faw_clock)
        lbl_faw_clock.topToBottom(of: lbl_adress!,offset: 4)
        lbl_faw_clock.left(to: lbl_name!)
        lbl_faw_clock.sizeToFit()
        
        lbl_time = MyLabel()
        lbl_time!.text = restaraunt?.get_work_hours_string()
        lbl_time!.textColor = Colors.getInstance.gray3
        lbl_time!.font = Fonts.getInstance.font_semi_xxxs
        self.addSubview(lbl_time!)
        lbl_time!.centerY(to: lbl_faw_clock)
        lbl_time!.leftToRight(of: lbl_faw_clock,offset: 10)
        
        let divider = UIView()
        divider.backgroundColor = Colors.getInstance.gray1
        self.addSubview(divider)
        
        divider.leftToSuperview()
        divider.rightToSuperview()
        divider.topToBottom(of: shadow_subview,offset:16)
        divider.height(1)
        
        
        let lbl_make_time = MyLabel()
        lbl_make_time.text = "Время приготовления"
        lbl_make_time.textColor = Colors.getInstance.gray2
        lbl_make_time.font = Fonts.getInstance.font_reg_xxs
        self.addSubview(lbl_make_time)
        lbl_make_time.leftToSuperview(offset:28)
        lbl_make_time.topToBottom(of: divider,offset: 12)
        lbl_make_time.sizeToFit()
        
        let picker_time = UIDatePicker()
        picker_time.datePickerMode = UIDatePicker.Mode.time
        picker_time.locale = NSLocale(localeIdentifier: "ru_RU") as Locale
        picker_time.setValue(Colors.getInstance.orange, forKeyPath: "textColor")
        self.addSubview(picker_time)
        picker_time.topToBottom(of: lbl_make_time,offset: 12)
        picker_time.leftToSuperview()
        picker_time.rightToSuperview()
        picker_time.height(160)
        
        
        let bottom_view = UIView()
        bottom_view.add_light_shadow()
        bottom_view.backgroundColor = Colors.getInstance.white
        self.addSubview(bottom_view)
        bottom_view.topToBottom(of: picker_time,offset: 12)
        bottom_view.leftToSuperview()
        bottom_view.rightToSuperview()
        
        let lbl_sum_title = MyLabel()
        lbl_sum_title.text = "Сумма : "
        lbl_sum_title.font = Fonts.getInstance.font_semi_xs
        lbl_sum_title.textColor = Colors.getInstance.gray4
        lbl_sum_title.textAlignment = .right
        bottom_view.addSubview(lbl_sum_title)
        lbl_sum_title.width(to: bottom_view,multiplier:0.49)
        lbl_sum_title.height(24)
        lbl_sum_title.topToSuperview(offset:12)
        lbl_sum_title.leftToSuperview()
        
        
        lbl_sum = MyLabel()
        lbl_sum!.text = "\(Int(sum!)) р"
        lbl_sum!.font = Fonts.getInstance.font_bold_xs
        lbl_sum!.textColor = Colors.getInstance.gray4
        lbl_sum?.textAlignment = .left
        bottom_view.addSubview(lbl_sum!)
        lbl_sum!.width(to: bottom_view,multiplier:0.49)
        lbl_sum!.height(24)
        lbl_sum!.topToSuperview(offset:12)
        lbl_sum!.rightToSuperview()
        
        
        btn_make = BtnOrange()
        btn_make!.setTitle("Оплатить", for: .normal)
        btn_make!.titleLabel!.font = Fonts.getInstance.font_bold_xs
        btn_make!.titleLabel!.textColor = Colors.getInstance.white
        btn_make!.layer.cornerRadius = 4
        bottom_view.addSubview(btn_make!)
        btn_make!.topToBottom(of: lbl_sum_title,offset:12)
        btn_make!.leftToSuperview(offset:12)
        btn_make!.rightToSuperview(offset:-12)
        btn_make!.height(36)
        btn_make!.click =
            {
                SwiftEntryKit.dismiss()
                self.clickedOk?()
        }
        
        var padding_bottom:CGFloat = 12
        
        if(UIDevice.current.monobrow_screen)
        {
            padding_bottom = 46
        }
        bottom_view.resize_to_fit_vertical(padding_bottom: padding_bottom)
        
    }
}
