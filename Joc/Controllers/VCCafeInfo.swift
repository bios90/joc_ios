import UIKit

class VCCafeInfo: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    var collectionView:UICollectionView?
    var restaraunt:Model_Restaraunt?
    let replies:[Model_Reply]
    
    init(restaraunt:Model_Restaraunt,replies:[Model_Reply])
    {
        self.restaraunt = restaraunt
        self.replies = replies
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView!.backgroundColor = .clear
        self.view.addSubview(collectionView!)
        collectionView?.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: -UIDevice.current.status_bar_heigh, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView!.register(CellRestarauntTop.self, forCellWithReuseIdentifier: CellRestarauntTop.cell_name)
        collectionView!.register(CellReplyLabel.self, forCellWithReuseIdentifier: CellReplyLabel.cell_name)
        collectionView!.register(CellReply.self, forCellWithReuseIdentifier: CellReply.cell_name)
        
        collectionView?.delegate = self
        collectionView!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return replies.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if(indexPath.item == 0)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellRestarauntTop.cell_name, for:indexPath) as! CellRestarauntTop
            cell.bindRestaraunt(restaunt: restaraunt!)
            return cell
        }
        else if(indexPath.item == 1)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReplyLabel.cell_name, for:indexPath) as! CellReplyLabel
            return cell
        }
        
        let reply = replies[indexPath.item-2]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReply.cell_name, for:indexPath) as! CellReply
        cell.bindReply(reply: reply)
        return cell
    }

}
