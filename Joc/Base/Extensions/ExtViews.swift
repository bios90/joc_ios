import Foundation
import UIKit

enum LINE_POSITION
{
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UIView
{
    func addLine(position : LINE_POSITION, color: UIColor, width: Double)
    {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position
        {
            case .LINE_POSITION_TOP:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            case .LINE_POSITION_BOTTOM:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
        }
    }
    
    func removeStackSubviews()
    {
//        let stack = self as! UIStackView
//        stack.arrangedSubviews.forEach({ $0.removeFromSuperview() })
    }
    
    func removeAllSubviews()
    {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func resizeScrollToStack(stack:UIStackView)
    {
        let scroll = self as! UIScrollView
        
        scroll.layoutIfNeeded()
        stack.layoutIfNeeded()
        scroll.contentSize.width = stack.frame.width
        scroll.contentSize.height = stack.frame.height
        
        print("Content height is \(stack.frame.height)")
    }
    
    func make_gradient(grad_layer:CAGradientLayer)
    {
        self.layoutIfNeeded()
        grad_layer.frame = self.bounds
        self.layer.insertSublayer(grad_layer, at: 0)
    }
    
    func add_shadow()
    {
        self.layer.backgroundColor = Colors.getInstance.white.cgColor
        self.layer.shadowColor = Colors.getInstance.gray5.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func add_light_shadow()
    {
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 4
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func make_round()
    {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    func add_shadow_and_roind()
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.red.cgColor
        
        self.addSubview(view)
        view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        view.layer.cornerRadius = self.frame.height/2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.backgroundColor = UIColor.white
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func resize_to_fit_vertical(padding_bottom:CGFloat)
    {
        if(self.subviews.count == 0)
        {
            print("self child coun is 0")
            return
        }
        self.bottomAnchor.constraint(equalTo: self.get_last_subview()!.bottomAnchor, constant: padding_bottom).isActive = true
    }
    
    func remove_child_clicks()
    {
        for view in self.subviews
        {
            view.isUserInteractionEnabled = false
        }
    }
    
    var heightConstaint: NSLayoutConstraint?
    {
        get
        {
            return constraints.first(where:
                {
                $0.firstAttribute == .height && $0.relation == .equal
                })
        }
        set
        {
            setNeedsLayout()
        }
    }
    
    func get_last_subview()->UIView?
    {
        let child_count = self.subviews.count
        if(child_count == 0)
        {
            return nil
        }
        
        return self.subviews[child_count-1]
    }
    
    var widthConstaint: NSLayoutConstraint?
    {
        get {
            return constraints.first(where:
                {
                $0.firstAttribute == .width && $0.relation == .equal
                })
        }
        set
        {
            setNeedsLayout()
        }
    }
    
    var bottomConstraint: NSLayoutConstraint?
    {
        get {
            return constraints.first(where:
                {
                    $0.firstAttribute == .bottom && $0.relation == .equal
            })
        }
        set
        {
            setNeedsLayout()
        }
    }
    
    func setAnchor(top:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,
                   right:NSLayoutXAxisAnchor?,
                   centerX:NSLayoutXAxisAnchor?,centerY:NSLayoutYAxisAnchor?,
                   paddingTop:CGFloat,paddingLeft:CGFloat,paddingBottom:CGFloat,paddingRight:CGFloat,
                   width:CGFloat = 0, height:CGFloat = 0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left
        {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom
        {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right
        {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let centerX = centerX
        {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY
        {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if width != 0
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func addToFillOther(view:UIView)
    {
        view.addSubview(self)
        self.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
