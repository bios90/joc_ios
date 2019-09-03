import UIKit

class VCCafe: BaseTabController,ProductCardListener
{
    var restaraunt:Model_Restaraunt
    
    init(restaraunt:Model_Restaraunt)
    {
        self.restaraunt = restaraunt
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.getInstance.gray0

        self.tabBar.unselectedItemTintColor = Colors.getInstance.gray3
        self.tabBar.tintColor = Colors.getInstance.orange
        
        self.tabBar.barTintColor = Colors.getInstance.white
        self.tabBar.isTranslucent = false
        
        let replies = RepoReplies.getReplies()
        replies.sorted(by: { $0.date! > $1.date!})
        
        
        let vc_products_cold = VCProducts(products: Array(restaraunt.products).filter({$0.type == 1}),listener: self)
        vc_products_cold.tabBarItem = TabItemFaw(faw_text: FawStrings.coffeeToGo)
        
        let vc_products_hot = VCProducts(products: Array(restaraunt.products).filter({$0.type == 0}),listener: self)
        vc_products_hot.tabBarItem = TabItemFaw(faw_text: FawStrings.coffeeHot)
        
        let vc_deserts = VCProducts(products: Array(restaraunt.products).filter({$0.type == 2}),listener: self)
        vc_deserts.tabBarItem = TabItemFaw(faw_text: FawStrings.cookie)
        
        let vc_cafe_info = VCCafeInfo(restaraunt:restaraunt,replies: replies)
        vc_cafe_info.tabBarItem = TabItemFaw(faw_text: FawStrings.infoCircle)
        
        
        
        let tabBarList = [vc_cafe_info,vc_products_cold,vc_products_hot,vc_deserts]
        
        viewControllers = tabBarList
    }
    
    func clickedProductCard(prdouct: Model_Product)
    {
        messagesManager?.show_product_dialog(product: prdouct, ok_click:
            {
                
        })
    }
    

}
