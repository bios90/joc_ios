import Foundation
import UIKit

class VCafeList: UIView
{
    var et_search: UITextField?
    var scroll_view : UIScrollView?
    
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
        self.layoutIfNeeded()
        
        scroll_view = UIScrollView()
        scroll_view!.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(scroll_view!)
        scroll_view!.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scroll_view!.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        scroll_view!.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scroll_view!.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func bind_restaraunts(restaraunts:[Model_Restaraunt],by_rating:Bool,listener:RestarauntCardListener)
    {
        var distances:[Int] = []
        
        for _ in 0..<restaraunts.count
        {
            let randomInt = Int.random(in: 76..<512)
            distances.append(randomInt)
        }
        
        var restaraunts_sorted:[Model_Restaraunt]
        if(by_rating)
        {
            restaraunts_sorted = restaraunts.sorted(by: { $0.rating > $1.rating })
        }
        else
        {
            restaraunts_sorted = restaraunts
            distances =  distances.sorted{ $0 < $1 }
        }
        
        var top_constraint = scroll_view!.topAnchor
        var previous_date :Date? = nil
        
        for (index, restaraunt) in restaraunts_sorted.enumerated()
        {
            let view = RestView(restaraunt: restaraunt,distance: distances[index])
            
            scroll_view!.addSubview(view)
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
            view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
            view.topAnchor.constraint(equalTo: top_constraint, constant: 8).isActive = true
            view.heightAnchor.constraint(equalToConstant: 128).isActive = true
            view.layoutIfNeeded()
            
            view.click =
                {
                    listener.clicked_card(restaraunt: restaraunt)
            }
            
            top_constraint = view.bottomAnchor
        }
            
        scroll_view!.resize_to_fit_vertical(padding_bottom: -40)
        
    }
}

