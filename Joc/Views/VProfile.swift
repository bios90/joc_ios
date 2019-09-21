import Foundation
import UIKit

class VProfile : UIView
{
    var img_profile : UIImageView?
    var lbl_name : UILabel?
    var lbl_phone : UILabel?
    var lbl_edit_profile:FawLabel?
    
    var lbl_cups_count:UILabel?
    var lbl_order_count:UILabel?
    var lbl_review_count:UILabel?
    
    var scroll_view:UIScrollView?
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindUser(user:Model_User)
    {
        lbl_name?.text = user.last_name!+" "+user.first_name!
        lbl_phone?.text = user.phone!
    }
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.getInstance.gray0
        
        let top_view = UIView()
        top_view.translatesAutoresizingMaskIntoConstraints = false
        
        var top_view_height:CGFloat = 190
        var top_margin:CGFloat = 36
        var lbl_edit_top_margin:CGFloat = 28
        
        if(UIDevice.current.monobrow_screen)
        {
            top_view_height += 20
            top_margin += 30
            lbl_edit_top_margin += 16
        }
        
        
        self.addSubview(top_view)
        top_view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        top_view.heightAnchor.constraint(equalToConstant: top_view_height).isActive = true
        top_view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        top_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        top_view.layoutIfNeeded()
        
        
        
        let bg = UIImageView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.image = UIImage(named: "grad_pattern2")
        bg.layer.shadowColor = Colors.getInstance.gray5.cgColor
        bg.layer.shadowOpacity = 0.4
        bg.layer.shadowRadius = 20
        bg.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        top_view.addSubview(bg)
        bg.widthAnchor.constraint(equalTo: top_view.widthAnchor).isActive = true
        bg.heightAnchor.constraint(equalToConstant: top_view_height+30).isActive = true
        bg.topAnchor.constraint(equalTo: top_view.topAnchor).isActive = true
        bg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bg.layoutIfNeeded()
        
        
        
        img_profile = CircleImage()
        img_profile?.translatesAutoresizingMaskIntoConstraints = false
        img_profile?.image = UIImage(named: "mike")
        
        top_view.addSubview(img_profile!)
        img_profile!.widthAnchor.constraint(equalToConstant: 100).isActive = true
        img_profile!.heightAnchor.constraint(equalToConstant: 100).isActive = true
        img_profile!.topAnchor.constraint(equalTo: top_view.topAnchor, constant: top_margin).isActive = true
        img_profile!.leftAnchor.constraint(equalTo: top_view.leftAnchor, constant: 10).isActive = true
        img_profile!.layoutIfNeeded()
        
        
        lbl_name = MyLabel()
        lbl_name!.textColor = UIColor.white
        lbl_name?.text = "Mike Penz"
        lbl_name?.font = Fonts.getInstance.font_bold_m
        lbl_name?.numberOfLines = 1
        
        top_view.addSubview(lbl_name!)
        lbl_name?.leftAnchor.constraint(equalTo: img_profile!.rightAnchor, constant: 6).isActive = true
        lbl_name?.topAnchor.constraint(equalTo: img_profile!.topAnchor, constant: 20).isActive = true
        lbl_name?.sizeToFit()
        
        
        lbl_phone = MyLabel()
        lbl_phone!.text = "+7 (916) 123-12-34"
        lbl_phone!.font = Fonts.getInstance.font_reg_xxxs
        lbl_phone!.textColor = Colors.getInstance.white
        lbl_phone!.numberOfLines = 1
        
        top_view.addSubview(lbl_phone!)
        lbl_phone?.leftAnchor.constraint(equalTo: img_profile!.rightAnchor, constant: 6).isActive = true
        lbl_phone?.topAnchor.constraint(equalTo: lbl_name!.bottomAnchor, constant: 0).isActive = true
        lbl_phone?.sizeToFit()
        
        
        
        lbl_edit_profile = FawLabel()
        lbl_edit_profile?.text = FawStrings.pencil
        lbl_edit_profile?.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl_edit_profile!)
        lbl_edit_profile?.widthAnchor.constraint(equalToConstant: 22).isActive = true
        lbl_edit_profile?.heightAnchor.constraint(equalToConstant: 22).isActive = true
        lbl_edit_profile?.topAnchor.constraint(equalTo: top_view.topAnchor, constant: lbl_edit_top_margin).isActive = true
        lbl_edit_profile?.rightAnchor.constraint(equalTo: top_view.rightAnchor, constant: -18).isActive = true
        lbl_edit_profile!.layoutIfNeeded()
        
     
        
        lbl_cups_count = MyLabel()
        lbl_cups_count!.font = Fonts.getInstance.font_bold_m
        lbl_cups_count!.text = "37"
        lbl_cups_count!.textAlignment = .center
        lbl_cups_count!.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl_cups_count!)
        lbl_cups_count!.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl_cups_count!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl_cups_count!.bottomAnchor.constraint(equalTo: top_view.bottomAnchor, constant: -0).isActive = true
        lbl_cups_count!.leftAnchor.constraint(equalTo: top_view.leftAnchor).isActive = true
        lbl_cups_count!.layoutIfNeeded()
        
        
        
        lbl_order_count = MyLabel()
        lbl_order_count!.font = Fonts.getInstance.font_bold_m
        lbl_order_count!.text = "17"
        lbl_order_count!.textAlignment = .center
        lbl_order_count!.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl_order_count!)
        lbl_order_count!.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl_order_count!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl_order_count!.bottomAnchor.constraint(equalTo: top_view.bottomAnchor, constant: -0).isActive = true
        lbl_order_count!.leftAnchor.constraint(equalTo: lbl_cups_count!.rightAnchor).isActive = true
        lbl_order_count!.layoutIfNeeded()
        
        
        lbl_review_count = MyLabel()
        lbl_review_count!.font = Fonts.getInstance.font_bold_m
        lbl_review_count!.text = "9"
        lbl_review_count!.textAlignment = .center
        lbl_review_count!.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl_review_count!)
        lbl_review_count!.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl_review_count!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl_review_count!.bottomAnchor.constraint(equalTo: top_view.bottomAnchor, constant: -0).isActive = true
        lbl_review_count!.leftAnchor.constraint(equalTo: lbl_order_count!.rightAnchor).isActive = true
        lbl_review_count!.layoutIfNeeded()
        
        
        let lbl1 = MyLabel()
        lbl1.font = Fonts.getInstance.font_reg_xxxs
        lbl1.text = "Кофе"
        lbl1.textAlignment = .center
        lbl1.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl1)
        lbl1.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl1.bottomAnchor.constraint(equalTo: lbl_cups_count!.topAnchor).isActive = true
        lbl1.leftAnchor.constraint(equalTo: top_view.leftAnchor).isActive = true
        lbl1.layoutIfNeeded()
        
        
        
        let lbl2 = MyLabel()
        lbl2.font = Fonts.getInstance.font_reg_xxxs
        lbl2.text = "Заказы"
        lbl2.textAlignment = .center
        lbl2.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl2)
        lbl2.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl2.bottomAnchor.constraint(equalTo: lbl_cups_count!.topAnchor).isActive = true
        lbl2.leftAnchor.constraint(equalTo: lbl1.rightAnchor).isActive = true
        lbl2.layoutIfNeeded()
        
        
        
        
        let lbl3 = MyLabel()
        lbl3.font = Fonts.getInstance.font_reg_xxxs
        lbl3.text = "Отзывы"
        lbl3.textAlignment = .center
        lbl3.textColor = Colors.getInstance.white
        
        top_view.addSubview(lbl3)
        lbl3.widthAnchor.constraint(equalTo: top_view.widthAnchor, multiplier: 0.333333).isActive = true
        lbl3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl3.bottomAnchor.constraint(equalTo: lbl_cups_count!.topAnchor).isActive = true
        lbl3.leftAnchor.constraint(equalTo: lbl2.rightAnchor).isActive = true
        lbl3.layoutIfNeeded()
        
        
        
        scroll_view = UIScrollView()
        scroll_view?.translatesAutoresizingMaskIntoConstraints = false
        scroll_view!.showsVerticalScrollIndicator = false
        
        self.addSubview(scroll_view!)
        scroll_view?.topAnchor.constraint(equalTo: top_view.bottomAnchor, constant: 10).isActive = true
        scroll_view?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scroll_view?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scroll_view?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scroll_view?.layoutIfNeeded()
        
        top_view.layer.zPosition = 1
    }
    
    
    
    func bind_orders(orders:[Model_Order],listerner:OrderCardListener)
    {
        var top_constraint = scroll_view!.topAnchor
        var previous_date :Date? = nil
        
        for order in orders
        {
            var top_margin:CGFloat = 8
            
            if(previous_date == nil || !order.date!.isSameDateTo(date: previous_date!))
            {
                let date_text = order.date?.fotmatToString()
                
                var date_margin_top : CGFloat = 16
                if(previous_date == nil)
                {
                    date_margin_top = 36
                }
                
                let lbl_date = MyLabel()
                lbl_date.textColor = Colors.getInstance.gray3
                lbl_date.text = date_text
                lbl_date.font = Fonts.getInstance.font_reg_xxs
                
                scroll_view?.addSubview(lbl_date)
                lbl_date.topAnchor.constraint(equalTo: top_constraint, constant: date_margin_top).isActive = true
                lbl_date.leftAnchor.constraint(equalTo: scroll_view!.leftAnchor, constant: 12).isActive = true
                lbl_date.sizeToFit()
                
                previous_date = order.date!
                top_constraint = lbl_date.bottomAnchor
                top_margin = 2
            }
            
            let view = OrderView(order: order)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            scroll_view?.addSubview(view)
            view.widthAnchor.constraint(equalTo: scroll_view!.widthAnchor, constant: -20).isActive = true
            view.heightAnchor.constraint(equalToConstant: 102).isActive = true
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            view.topAnchor.constraint(equalTo: top_constraint, constant: top_margin).isActive = true
            
            top_constraint = view.bottomAnchor
            
            view.click =
                {
                    print("clicked")
                    listerner.clicked_card(order: order)
            }
        }
        
        scroll_view!.resize_to_fit_vertical(padding_bottom: 8)
    }
}
