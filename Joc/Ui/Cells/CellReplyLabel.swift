
//
//  CellReplyLable.swift
//  Joc
//
//  Created by Филипп Бесядовский on 30/08/2019.
//  Copyright © 2019 dimfcompany. All rights reserved.
//

import UIKit

class CellReplyLabel: UICollectionViewCell
{
    static let cell_name = "CellReplyLable"
    
    override init(frame: CGRect)
    {
        super.init(frame:.zero)
        let lbl = MyLabel()
        lbl.textColor = Colors.getInstance.gray4
        lbl.font = Fonts.getInstance.font_bold_s
        lbl.text = "Отзывы"
        lbl.textAlignment = .left
        self.contentView.addSubview(lbl)
        let width = UIScreen.main.bounds.width
        lbl.setAnchor(top: contentView.topAnchor, left: nil, bottom: contentView.bottomAnchor, right: nil, centerX: contentView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: width-20)
        
        self.contentView.resize_to_fit_vertical(padding_bottom: 0)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
