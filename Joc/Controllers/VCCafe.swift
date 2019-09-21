import UIKit

protocol BackPressable
{
    func backPressed()
}

class VCCafe: BaseSwipableTabCpntroller,ProductsListener,ProductDialogListener,BasketItemListener,BackPressable
{
    var restaraunt:Model_Restaraunt
    var added_items:[Model_Added_Item] = []
    
    var vc_basket:VCBasket?
    var tabItemBasket:TabItemFaw?
    
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
        
        BaseNavController.getInstance?.setStatusBarColor(black: false)
        
        self.view.backgroundColor = Colors.getInstance.gray0

        self.tabBar.unselectedItemTintColor = Colors.getInstance.gray3
        self.tabBar.tintColor = Colors.getInstance.orange
        
        self.tabBar.barTintColor = Colors.getInstance.white
        self.tabBar.isTranslucent = false
        
        let products_hot = Array(restaraunt.products).filter({$0.type == 0})
        let products_cold = Array(restaraunt.products).filter({$0.type == 1})
        let products_deserts = Array(restaraunt.products).filter({$0.type == 2})
        
        let replies = RepoReplies.getReplies()
        replies.sorted(by: { $0.date! > $1.date!})
        
        let vc_products_cold = VCProducts(products: products_cold,listener: self,backPressedListener:self)
        vc_products_cold.tabBarItem = TabItemFaw(faw_text: FawStrings.coffeeToGo)
        
        let vc_products_hot = VCProducts(products: products_hot,listener: self,backPressedListener:self)
        vc_products_hot.tabBarItem = TabItemFaw(faw_text: FawStrings.coffeeHot)
        
        let vc_deserts = VCProducts(products: products_deserts,listener: self,backPressedListener:self)
        vc_deserts.tabBarItem = TabItemFaw(faw_text: FawStrings.cookie)
        
        vc_basket = VCBasket(backPressedListener:self)
        tabItemBasket = TabItemFaw(faw_text: FawStrings.shoppingBag)
        vc_basket!.tabBarItem = tabItemBasket
        
        
        
        let vc_cafe_info = VCCafeInfo(restaraunt:restaraunt,replies: replies)
        vc_cafe_info.tabBarItem = TabItemFaw(faw_text: FawStrings.infoCircle)
        
        
        let tabBarList = [vc_cafe_info,vc_products_cold,vc_products_hot,vc_deserts,vc_basket!]
        
        viewControllers = tabBarList
        selectedIndex = 2
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    func clickedProductCard(prdouct: Model_Product)
    {
        print("Tesxt t;sdlm;as")
        
        messagesManager?.show_product_dialog(product: prdouct, listener: self)
    }
    
    func clickedAdd(counter: CounterHelper)
    {
        print("Will add item")
        
        var added_item = Model_Added_Item()
        added_item.product = counter.dialog!.product
        
        added_item.selected_weight = counter.getCurrentWeight()
        added_item.selected_milk = counter.getCurrentMilk()
        added_item.selected_adds = counter.getCurrentAdds()
        added_item.selected_sugar = counter.getCurrentSugar()
        added_item.sum = counter.getCurrentSum()
        
        added_items.append(added_item)
        
        reset_basket()
    }
    
    func reset_basket()
    {
        vc_basket!.bind_items(items: added_items, listener: self)
        
        if(added_items.count > 0)
        {
            tabItemBasket!.badgeValue = "\(added_items.count)"
            tabItemBasket!.badgeColor = Colors.getInstance.green
        }
        else
        {
            tabItemBasket!.badgeValue = nil
        }
    }
    
    func clickedItem(item: Model_Added_Item)
    {
        
    }
    
    func clickedDelete(item: Model_Added_Item)
    {
        let index = added_items.firstIndex{$0.product?.name == item.product?.name && $0.sum == item.sum && $0.selected_weight == item.selected_weight  }
        added_items.remove(at: index!)
        reset_basket()
    }
    
    func backPressed()
    {
        navigationController?.popViewController(animated: true)
    }
    
    func clickedMakeOrder(sum: Double)
    {
            messagesManager?.showFinalDialog(restaraunt: restaraunt, sum: sum, clickedOk:
                {
                    self.messagesManager?.showGreenAlerter(text: "Заказ оформлен")
            })
    }
    
    

}
