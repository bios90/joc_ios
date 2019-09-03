import Foundation
import UIKit


class LaOrderDialog : UIView
{
    var text:String?
    var order:Model_Order?
    var lbl_cafe_name:MyLabel?
    var lbl_date:MyLabel?
    var btn_repeat:BtnOrange?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (order:Model_Order)
    {
        super.init(frame: CGRect.zero)
        self.order = order
        customInit()
    }
    
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.getInstance.white
        self.layer.cornerRadius = 4
        self.add_shadow()
        
        let top_image = UIImageView()
        top_image.translatesAutoresizingMaskIntoConstraints = false
        top_image.image = UIImage(named: "pattern_small")
        
        self.addSubview(top_image)
        top_image.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        top_image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        top_image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        top_image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        top_image.layoutIfNeeded()
        
        
        lbl_cafe_name = MyLabel()
        lbl_cafe_name!.text = order!.restaraunt!.name!
        lbl_cafe_name!.font = Fonts.getInstance.font_bold_s
        lbl_cafe_name?.textColor = Colors.getInstance.white
        
        self.addSubview(lbl_cafe_name!)
        lbl_cafe_name!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_cafe_name!.topAnchor.constraint(equalTo: self.topAnchor,constant: 12).isActive = true
        lbl_cafe_name!.sizeToFit()
        
        
        
        lbl_date = MyLabel()
        lbl_date!.text = order!.date!.fotmatToString()
        lbl_date!.font = Fonts.getInstance.font_reg_xxxs
        lbl_date!.textColor = Colors.getInstance.white
        
        self.addSubview(lbl_date!)
        lbl_date!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_date!.topAnchor.constraint(equalTo: lbl_cafe_name!.bottomAnchor,constant: 0).isActive = true
        lbl_date!.sizeToFit()
        
        
        let products = order!.items!.components(separatedBy: ", ")
        
        var top_constraint = top_image.bottomAnchor
        
        for (index, element) in products.enumerated()
        {
            var margin_top:CGFloat
            if(index == 0)
            {
                margin_top = 20
            }
            else
            {
                margin_top = 6
            }
            
            let lbl_product = MyLabel()
            lbl_product.text = element
            lbl_product.font = Fonts.getInstance.font_reg_xs
            lbl_product.textColor = Colors.getInstance.gray3
            
            self.addSubview(lbl_product)
            lbl_product.leftAnchor.constraint(equalTo: self.leftAnchor,constant:20).isActive = true
            lbl_product.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
            lbl_product.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            lbl_product.topAnchor.constraint(equalTo: top_constraint, constant: margin_top).isActive = true
            lbl_product.layoutIfNeeded()
            
            top_constraint = lbl_product.bottomAnchor
        }

        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = Colors.getInstance.gray3
        
        self.addSubview(line)
        line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.topAnchor.constraint(equalTo: top_constraint, constant: 14).isActive = true
        line.layoutIfNeeded()
        
        
        var text:String?
        var color:UIColor?
        
        if(order?.status == 1)
        {
            text = "Сумма: \(Int(order!.sum)) р"
            color = Colors.getInstance.green
        }
        else
        {
            text = "Отменен"
            color = Colors.getInstance.red
        }
        
        let lbl_price = MyLabel()
        lbl_price.text = text!
        lbl_price.textColor = color!
        lbl_price.font = Fonts.getInstance.font_bold_s
        
        self.addSubview(lbl_price)
        lbl_price.topAnchor.constraint(equalTo: line.bottomAnchor , constant: 18).isActive = true
        lbl_price.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_price.sizeToFit()
        
        
        btn_repeat = BtnOrange()
        btn_repeat!.setTitle("Повторить", for: .normal)
        btn_repeat!.layer.cornerRadius = 4
        
        self.addSubview(btn_repeat!)
        btn_repeat!.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        btn_repeat!.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        btn_repeat!.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn_repeat!.topAnchor.constraint(equalTo: lbl_price.bottomAnchor, constant: 18).isActive = true
        btn_repeat!.layoutIfNeeded()
        
        
    }
}
