//
//  CellReply.swift
//  Joc
//
//  Created by Филипп Бесядовский on 31/08/2019.
//  Copyright © 2019 dimfcompany. All rights reserved.
//

import UIKit

class CellReply: UICollectionViewCell
{
    var reply:Model_Reply?
    static let cell_name = "CellReply"
    var click : (() -> Void)?
    private var darkerView:UIView?
    var la_reply:UIView?
    

    lazy var width: NSLayoutConstraint =
        {
            let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
            width.isActive = true
            return width
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame:.zero)
        self.add_light_shadow()
    }
    
    func bindReply(reply:Model_Reply)
    {
        la_reply = LaReply(reply: reply)
        self.contentView.addSubview(la_reply!)
        la_reply?.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 3, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
    
        let touchRecognizer = UILongPressGestureRecognizer(target:self, action: #selector(pressed))
        touchRecognizer.minimumPressDuration = 0.03
        contentView.addGestureRecognizer(touchRecognizer)
        contentView.isUserInteractionEnabled = true
        contentView.clipsToBounds = true

        contentView.bottomAnchor.constraint(equalTo: la_reply!.bottomAnchor, constant: 3).isActive = true
    }
    
    
    @objc func pressed(gesture: UILongPressGestureRecognizer)
    {
        if gesture.state == .began
        {
            self.addDarkerView()
        }
        else if gesture.state == .ended || gesture.state == .cancelled
        {
            self.deleteDarkerView()
            let touchPoint = gesture.location(in: self)
            
            let x = touchPoint.x
            let y = touchPoint.y
            
            if((x < self.frame.width && x > 0) && (y < self.frame.height && y > 0))
            {
                click?()
            }
        }
    }
    
    func addDarkerView()
    {
        darkerView = UIView()
        darkerView!.tag = 9999999
        darkerView!.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        la_reply!.addSubview(darkerView!)
        darkerView!.setAnchor(top: la_reply!.topAnchor, left: la_reply!.leftAnchor, bottom: la_reply!.bottomAnchor, right: la_reply!.rightAnchor, centerX: nil, centerY: nil
            , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func deleteDarkerView()
    {
        if let viewWithTag = la_reply!.viewWithTag(9999999)
        {
            viewWithTag.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
    {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }

}
