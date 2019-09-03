import UIKit

class VCProducts: BaseViewContoller,UICollectionViewDelegate,UICollectionViewDataSource
{
    var collectionView:UICollectionView?
    var lbl_header:MyLabel?
    var products:[Model_Product]?
    var listener:ProductCardListener?
    
    init(products:[Model_Product],listener:ProductCardListener)
    {
        self.products = products
        self.listener = listener
        super.init(nibName: nil, bundle: nil)
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
        grad_view.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 0,height: 54)
        grad_view.make_gradient(grad_layer: Colors.getInstance.getOrangeGradient(horizontal: true))
        
        lbl_header = MyLabel()
        lbl_header!.textColor = Colors.getInstance.white
        lbl_header!.font = Fonts.getInstance.font_semi_s
        lbl_header!.textAlignment = .center
        
        lbl_header!.text = text
        
        self.view.addSubview(lbl_header!)
        lbl_header?.setAnchor(top: grad_view.topAnchor, left: grad_view.leftAnchor, bottom: grad_view.bottomAnchor, right: grad_view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView!.backgroundColor = Colors.getInstance.white
        self.view.addSubview(collectionView!)
        collectionView?.setAnchor(top: lbl_header?.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 6, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
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

}
