import Foundation
import UIKit
import SwipeableTabBarController

class VCCafeList : BaseViewContoller,RestarauntCardListener
{
    var by_rating:Bool
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
    }
    
    init(by_rating:Bool)
    {
        self.by_rating = by_rating
        super.init(statusColorBlack:true)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadViews()
    {
        setNeedsStatusBarAppearanceUpdate()
        var margin_top:CGFloat
        
        if(UIDevice.current.monobrow_screen)
        {
            margin_top = 88 - 44
        }
        else
        {
            margin_top = 56 - 8
        }
        
        let view_cafe_list = VCafeList()
        self.view.addSubview(view_cafe_list)
        view_cafe_list.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        view_cafe_list.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant:margin_top).isActive = true
        view_cafe_list.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        view_cafe_list.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        view_cafe_list.layoutIfNeeded()
        
        var restaraunts = RepoRestaraunts.getRestaraunts()
        restaraunts.append(contentsOf: RepoRestaraunts.getRestaraunts())
        
        view_cafe_list.bind_restaraunts(restaraunts: restaraunts, by_rating: self.by_rating, listener: self)
    }
    
    func clicked_card(restaraunt: Model_Restaraunt)
    {
        print("Hereeee")
        messagesManager!.show_restaraunt_dialog(restaraunt: restaraunt, ok_click:
            {
            self.navigationManager?.toVcCafe(restaraunt: restaraunt)
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
