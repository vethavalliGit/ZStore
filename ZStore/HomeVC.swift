//
//  ViewController.swift
//  ZStore
//
//  Created by Vetha on 25/05/24.
//

import UIKit
import CoreData


class HomeVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,WaterfallLayoutDelegate {
    var collectionView: UICollectionView!
    var viewModel = ProductViewModel()
    var sorButton = UIButton()
    
    var blurEffectView: UIVisualEffectView?
    
    let colorsArray: [[UIColor]] = [
        [.red],
        [.orange]
    ]
    
    var favList = [String: Any]()
    var unfavlist = ["":""]
    
//    var list : [catageroies_list]?
//    
//    var prolist : [products_list]?
//    
//    
//    var cardlist : [card_offers]?
//    {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
    
  
   // let productViewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        @nonobjc public class func fetchRequest() -> NSFetchRequest<catageroies_list> {
//            return NSFetchRequest<catageroies_list>(entityName: "Catageroies")
//        }
//        fetchRequest
//        let fetchRequest: NSFetchRequest<catageroies_list> = catageroies_list.fetchRequest()
//        list = try? containerCatageroies.viewContext.fetch(fetchRequest) as? [catageroies_list]
//       
//        let fetchRequestcard: NSFetchRequest<card_offers> = card_offers.fetchRequest()
//        cardlist = try? containerCardoffers.viewContext.fetch(fetchRequestcard) as? [card_offers]
        
    
       

        
//        let fetchAll = NSFetchRequest<NSFetchRequestResult>(entityName: "Catageroies")
//        list = try? containerCatageroies.
       
       // print("fyygyg",list?.count)
        //        registerCell()
        
     
       // setupCollectionView()
        //        layoutConfig()
        apiConfig()
        button()
        //if viewModel.products?.category.first?.layout == "waterfall"{
            setupWaterfall()
//        }else{
//            layoutConfig()
//        }
//
        view.addSubview(questionLabel)
    }

    let questionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        
        return label
    }()
    

    func button(){
        let image = UIImage(named: "sort_img") as UIImage?
        
        sorButton.setImage(image, for: .normal)
        sorButton.translatesAutoresizingMaskIntoConstraints = false
        sorButton.backgroundColor = .brown
        
        sorButton.backgroundColor = .orange // Set button background color
        sorButton.setTitleColor(.white, for: .normal) // Set button text color
        sorButton.layer.cornerRadius = 25
        sorButton.addTarget(self, action: #selector(configureDropDownButton), for: .touchUpInside)
        view.addSubview(sorButton)
        NSLayoutConstraint.activate([
            //sorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sorButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sorButton.heightAnchor.constraint(equalToConstant: 50),
            sorButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func configureDropDownButton() {
        // Create the menu options
        
        let ratingAction = UIAction(title: "Rating", image: UIImage(systemName: "star.fill")) { [weak self] action in
            self?.filterByRating()
        }
        
        let priceAction = UIAction(title: "Price", image: UIImage(systemName: "dollarsign.circle")) { [weak self] action in
            self?.filterByPrice()
        }
        
        // Initially set "Rating" as the selected action
        ratingAction.state = .on
        let menu = UIMenu(title: "Filter Order: From Top to Bottom", children: [ratingAction, priceAction])
        sorButton.menu = menu
        sorButton.showsMenuAsPrimaryAction = true
        addBlurEffect()
    }
    
    // Actions for the menu items
     func filterByRating() {
        print("Filter by Rating selected")
        // Your filtering logic here
    }
    
     func filterByPrice() {
        print("Filter by Price selected")
        // Your filtering logic here
    }
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        blurEffectView?.backgroundColor =  UIColor(red: 0.031, green: 0.082, blue: 0.141, alpha: 0.6)
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView?.alpha = 0.6 // Adjust the alpha to reduce the blur intensity
        if let blurEffectView = blurEffectView {
            view.addSubview(blurEffectView)
            view.bringSubviewToFront(sorButton)
        }
    }
    
    func removeBlurEffect() {
        blurEffectView?.removeFromSuperview()
        blurEffectView = nil
    }
    
    
    func apiConfig(){
        viewModel.fetchProducts { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func registerCell(){
        collectionView.register(UINib(nibName: "CategoryCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(UINib(nibName: "HeaderCell", bundle: Bundle.main), forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderCell")
        collectionView.register(UINib(nibName: "OffersCell", bundle: Bundle.main), forCellWithReuseIdentifier: "OffersCell")
        collectionView.register(UINib(nibName: "ProductCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ProductCell")
        collectionView.register(UINib(nibName: "BooksCell", bundle: Bundle.main), forCellWithReuseIdentifier: "BooksCell")
    
    }
    
    func setupWaterfall(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.categorySection()
            default:
                return self.Waterlayout()
            }
        }
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Register cells and supplementary views
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
        collectionView.register(SearchHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCell")
        collectionView.register(BooksCell.self, forCellWithReuseIdentifier: "BooksCell")
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.categorySection()
            case 1:
                return self.OffersView()
            default:
                return self.Waterlayout()
            }
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Register cells and supplementary views
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
        collectionView.register(SearchHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCell")
        collectionView.register(OffersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "OffersHeader")
        collectionView.register(OffersCell.self, forCellWithReuseIdentifier: "OffersCell")
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.register(BooksCell.self, forCellWithReuseIdentifier: "BooksCell")
    }
    
    func layoutConfig() {
        // Layout configuration is now handled within the setupCollectionView method
    }
    
    func Waterlayout() -> NSCollectionLayoutSection {
        //            let layout = WaterfallLayout()
        //  let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
        // Define the layout for each section of the collection view
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        
        return section
    }
    
    func categorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(45))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        group.interItemSpacing = .fixed(10)
        section.boundarySupplementaryItems = [header]
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    func OffersView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(115))
        let itemSize = NSCollectionLayoutItem(layoutSize: item)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(115))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemSize])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func itemlistView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(135))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(135))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //   let dict = viewModel.storeProductsListData[indexPath.row]
        //        let img = UIImage(url: URL(string: dict.featuredSrc ?? ""))
        //        if img?.size.height ?? 0 > 200{
        //            return CGSize.init(width: collectionView.frame.width  / 2 - 15, height: 200)
        //        }else{
        //            return CGSize.init(width: collectionView.frame.width  / 2 - 15, height: img?.size.height ?? 200)
        //
        //        }
        
        //           let labelHeight = heightForLable(text: dict.productName, font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont(), width: collectionView.frame.width / 2 - 10)
        //           if dict.trending == 1{
        return CGSize.init(width: collectionView.frame.width  / 2 - 15, height: 260)
        //           }else{
        //               return CGSize.init(width: collectionView.frame.width  / 2 - 15, height: 250 + labelHeight)
        //           }
        
        
    }
    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        return .waterfall(column: 2, distributionMethod: .balanced)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, headerHeightFor section: Int) -> CGFloat? {
        50
    }
    func heightForLable(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        // pass string, font, LableWidth
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }

}

extension HomeVC {
    
//     func addToFavorites(data:Product) {
//        // favList.app
//        
//        
//        
//        }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
           // let category = productModel?.category[indexPath.item]
       
            return viewModel.products?.category.count ?? 0
       
        } else {
            return viewModel.products?.products.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            cell.configure(with: viewModel.products?.category[indexPath.item].name ?? "")
           
            
            
            
            return cell
            //        case 1:
            //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
            //
            //
            //            if  indexPath.row < viewModel.products?.cardOffers.count ?? 0 {
            //                let item = viewModel.products?.cardOffers[indexPath.row]
            //                // Do something with item
            //
            //                cell.configure(with: item?.cardName ?? "", offerEmI:  item?.offerDesc ?? "", offerCashback: item?.maxDiscount ?? "")
            //                if let urlString = viewModel.products?.cardOffers[indexPath.row].imageURL {
            //                    cell.loadImage(from: urlString, for: cell)
            //
            //                }
            //            } else {
            //                // Handle the case where the index is out of range
            //            }
            //
            //            return cell
        default:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCell", for: indexPath) as! BooksCell
//                   let dict = viewModel.products?.products[indexPath.row]
//                   let isFavorite = checkIfFavorite(productId: dict?.id)
//                   cell.configure(with: "\(dict?.name ?? "")", price: "₹\(dict?.price ?? 0.0)", rating: dict?.rating ?? 0.0, reviews: dict?.reviewCount ?? 0, desc: "\(dict?.description ?? "")", isFavorite: isFavorite)
//                   cell.FavoriteButton.tag = indexPath.row
                 //  cell.FavoriteButton.addTarget(self, action: #selector(addToFavorites(_:)), for: .touchUpInside)
             
            
            if  indexPath.row < viewModel.products?.products.count ?? 0 {
                let item = viewModel.products?.products[indexPath.row]
                            // Do something with item
                cell.configure(with: "\(item?.name ?? "")", price: "₹\(item?.price ?? 0.0)", rating: item?.rating ?? 0.0, reviews: item?.reviewCount ?? 0, desc: "\(item?.description ?? "")", isFavorite: false)
                
//                            cell.configure(with: item?.cardName ?? "", offerEmI:  item?.offerDesc ?? "", offerCashback: item?.maxDiscount ?? "")
                if let urlString = viewModel.products?.products[indexPath.row].imageURL {
                                cell.loadImage(from: urlString, for: cell)
            
                            }
                        } else {
                            // Handle the case where the index is out of range
                        }
            
                cell.contentView.layer.cornerRadius = 20
                cell.contentView.layer.borderWidth = 1
                cell.layer.borderColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
                return cell
          //  }
        
//            } else {
////                // Dequeue ProductCell
////                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
////                let dict = viewModel.products?.products[indexPath.row]
////                cell.nameLabel.text = dict?.name
////                cell.nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
////                cell.nameLabel.font = UIFont(name: "SFProText-Semibold", size: 18)
////                cell.nameLabel.numberOfLines = 0
////                cell.nameLabel.lineBreakMode = .byWordWrapping
////                
////                if let urlString = viewModel.products?.products[indexPath.row].imageURL {
////                    cell.loadImage(from: urlString, for: cell)
////                }
////                
////                cell.priceLabel.text = "₹\(Double(dict?.price ?? 0.0))"
////                cell.priceLabel2.text = "₹64,999"
////                cell.deliverylbl.text = dict?.description
////                cell.ratinglbl.text =  "\(Double(dict?.rating ?? 0.0))"
////                cell.ratinglbl.textColor = UIColor(red: 0.902, green: 0.337, blue: 0.059, alpha: 1)
////                cell.ratinglbl.font = UIFont(name: "SFProText-Semibold", size: 13)
////                cell.setColors(colorsArray.first ?? [.black])
////                return cell
//            }
            
        }
        
      
            
            func checkIfFavorite(productId: String?) -> Bool {
                // Implement logic to check if the product is marked as favorite in the local database
                return false // Change to actual check
            }
            
            func addProductToFavorites(productId: String?) {
                // Implement logic to add the product to the favorite list in the local database
            }
            
            func removeProductFromFavorites(productId: String?) {
                // Implement logic to remove the product from the favorite list in the local database
            }
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell
        
        if((cell?.isSelected) != nil){
            cell?.contentView.backgroundColor = .lightGray
            cell?.contentView.layer.backgroundColor = UIColor(red: 0.997, green: 0.948, blue: 0.923, alpha: 1).cgColor
            cell?.contentView.layer.cornerRadius = 24
            cell?.contentView.layer.borderWidth = 1.5
            cell?.contentView.layer.borderColor = UIColor(red: 0.902, green: 0.337, blue: 0.059, alpha: 1).cgColor
            cell?.nametext.textColor = UIColor(red: 0.902, green: 0.337, blue: 0.059, alpha: 1)
            // cell.contentView.backgroundColor.layer.borderWidth = 1.5
            // cell.contentView.backgroundColor.layer.borderColor = UIColor(red: 0.902, green: 0.337, blue: 0.059, alpha: 1).cgColor
            
        }else{
            cell?.backgroundColor = UIColor.white
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Space between rows
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Space between items in the same row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2 // Example: 2 items per row with 10pt spacing
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0{
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchHeaderCell", for: indexPath) as! SearchHeaderCell
                
                cell.titleLabel.text = "Zstore"
                return cell
            }else if indexPath.section == 1 {
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "OffersHeader", for: indexPath) as! OffersHeader
                
                cell.offerImageView.image = UIImage(named: "off_img")
                
                return cell
                
            } else {
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
                
                return cell
            }
        default:
            return UICollectionReusableView()
        }
    }
}
