import UIKit
import TinyConstraints

class VCProducts: BaseViewContoller,UICollectionViewDelegate,UICollectionViewDataSource
{
    var collectionView:UICollectionView?
    var lbl_header:MyLabel?
    var products:[Model_Product]?
    var listener:ProductsListener?
    var lblArrowBack : FawLabel?
    var backPressedListener:BackPressable?
    
    init(products:[Model_Product],listener:ProductsListener,backPressedListener:BackPressable)
    {
        self.products = products
        self.listener = listener
        self.backPressedListener = backPressedListener
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
    }
    
    func setup()
    {
        setNeedsStatusBarAppearanceUpdate()
        
        var text = ""
        if(products![0].type == 0)
        {
            text = "Горячие Напитики"
        }
        else if (products![0].type == 1)
        {
            text = "Холодные Напитики"
        }
        else
        {
            text = "Закуски"
        }
        
        let grad_view = UIView()
        self.view.addSubview(grad_view)
        grad_view.edgesToSuperview(excluding: .bottom)
        grad_view.height(40+UIDevice.current.status_bar_height)
        grad_view.make_gradient(grad_layer: Colors.getInstance.getOrangeGradient(horizontal: true))
        
        lbl_header = MyLabel()
        lbl_header!.textColor = Colors.getInstance.white
        lbl_header!.font = Fonts.getInstance.font_semi_s
        lbl_header!.textAlignment = .center
        
        lbl_header!.text = text
        
        grad_view.addSubview(lbl_header!)
        lbl_header!.bottomToSuperview(offset:-16)
        lbl_header!.centerXToSuperview()
        lbl_header!.sizeToFit()
        
        lblArrowBack = FawArrowBack.getArrow()
        grad_view.addSubview(lblArrowBack!)
        lblArrowBack!.leftToSuperview(offset:20)
        lblArrowBack!.centerY(to: lbl_header!)
        lblArrowBack!.sizeToFit()
        
        lblArrowBack?.click =
            {
                self.backPressedListener?.backPressed()
        }
        
        
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView!.backgroundColor = Colors.getInstance.white
        self.view.addSubview(collectionView!)
        
        collectionView!.edgesToSuperview(excluding: .top)
        collectionView!.topToBottom(of: grad_view,offset: 6)
 
        
        collectionView?.register(CellProduct.self, forCellWithReuseIdentifier: CellProduct.cell_name)
        
        collectionView?.delegate = self
        collectionView!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return products!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellProduct.cell_name, for:indexPath) as! CellProduct
        if let product = products?[indexPath.item]
        {
            cell.bindProduct(product: product)
            cell.click = {
                self.listener!.clickedProductCard(prdouct: product)
            }
        }
        
        return cell
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}
