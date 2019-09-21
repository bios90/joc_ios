import Foundation
import UIKit
import GoogleMaps

class VMap: UIView
{
    var google_map : GMSMapView!
    var et_search: UITextField!
    
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
        
        google_map = GMSMapView()
        google_map.translatesAutoresizingMaskIntoConstraints  = false
        self.addSubview(google_map)
        google_map.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        google_map.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        google_map.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        google_map.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        google_map.layoutIfNeeded()
        
        
        let view_for_search = UIView()
        view_for_search.backgroundColor = Colors.getInstance.white
        view_for_search.layer.cornerRadius = 4
        view_for_search.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(view_for_search)
        view_for_search.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        view_for_search.heightAnchor.constraint(equalToConstant: 54).isActive = true
        view_for_search.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view_for_search.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        view_for_search.add_shadow()
        
        self.addSubview(view_for_search)
        
        et_search = UITextField()
        et_search.translatesAutoresizingMaskIntoConstraints = false
        et_search.textColor = Colors.getInstance.gray4
        et_search.textAlignment = .left
        et_search.addLine(position: .LINE_POSITION_BOTTOM, color: Colors.getInstance.gray2, width: 1)
        et_search.returnKeyType = .done
    
        view_for_search.addSubview(et_search)
        et_search.widthAnchor.constraint(equalTo: view_for_search.widthAnchor, constant: -24).isActive = true
        et_search.heightAnchor.constraint(equalTo: view_for_search.heightAnchor, constant: -20).isActive = true
        et_search.centerXAnchor.constraint(equalTo: view_for_search.centerXAnchor).isActive = true
        et_search.centerYAnchor.constraint(equalTo: view_for_search.centerYAnchor).isActive = true
        
        
        let ic_search = FawLabel()
        ic_search.textColor = Colors.getInstance.gray3
        ic_search.text = FawStrings.search
        
        view_for_search.addSubview(ic_search)
        ic_search.widthAnchor.constraint(equalToConstant: 28).isActive = true
        ic_search.heightAnchor.constraint(equalToConstant: 28).isActive = true
        ic_search.rightAnchor.constraint(equalTo: view_for_search.rightAnchor, constant: -12).isActive = true
        ic_search.centerYAnchor.constraint(equalTo: view_for_search.centerYAnchor).isActive = true
    }
}
