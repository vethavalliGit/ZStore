//
//  BooksCell.swift
//  ZStore
//
//  Created by Vetha on 29/05/24.
//

import UIKit

class BooksCell: UICollectionViewCell {
    
    let bookImg = UIImageView()
    
    static let identifier = "BookCell"
    
   
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let ratingView = RatingView()
    let addButton = UIButton()
    let descr = UILabel()
    let ratinglbl = UILabel()
    let FavoriteButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bookImg.backgroundColor = .systemGray5
        //contentView.backgroundColor = .gray
        FavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        bookImg.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
     
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupViews(){
        
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
       
        descr.font =  UIFont.systemFont(ofSize: 13, weight: .regular)
        descr.numberOfLines = 2
        descr.translatesAutoresizingMaskIntoConstraints = false
      
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("Add to Fav", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.titleLabel?.font =  UIFont.systemFont(ofSize: 14, weight: .regular)
        addButton.translatesAutoresizingMaskIntoConstraints = false
       // addButton.backgroundColor = .systemPink
        
        
        let heartImage = UIImage(systemName: "heart")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        addButton.setImage(heartImage, for: .normal)
                
        addButton.semanticContentAttribute = .forceLeftToRight
        addButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
                
                // Set border
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.systemGray.cgColor
        addButton.layer.cornerRadius = 10
        addButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 4, bottom: 8, right: 12)
       
        
        
        ratinglbl.translatesAutoresizingMaskIntoConstraints = false
        ratinglbl.text = "4.5"
        ratinglbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
        ratinglbl.textAlignment = .center
        
     let heartIma = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
     FavoriteButton.setImage(heartIma, for: .normal)
     FavoriteButton.tintColor = .white // White heart color
     FavoriteButton.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0) // Pink background color
    // FavoriteButton.layer.cornerRadius = 20 // Half the size to make it round
     FavoriteButton.clipsToBounds = true
      //  FavoriteButton.addTarget(self, action: #selector(addToFavorites(_:)), for: .touchUpInside)
        
        
        
        contentView.addSubview(bookImg)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(ratingView)
        contentView.addSubview(addButton)
        contentView.addSubview(descr)
        contentView.addSubview(ratinglbl)
        contentView.addSubview(FavoriteButton)
        
        
        //    bookImg.image = UIImage(named: "product_img")
        
        NSLayoutConstraint.activate([
            
            bookImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 ),
            bookImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200),
          //  bookImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 ),
           // bookImg.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            bookImg.heightAnchor.constraint(equalToConstant: 200),
            bookImg.widthAnchor.constraint(equalToConstant: 181),
            //            bookImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            FavoriteButton.widthAnchor.constraint(equalToConstant: 40),
            FavoriteButton.heightAnchor.constraint(equalToConstant: 40),
            FavoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            FavoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            
            
            titleLabel.topAnchor.constraint(equalTo: bookImg.bottomAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
         
            
            
            
            priceLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -130),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            
            
            
            descr.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            descr.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            descr.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            
//            addButton.topAnchor.constraint(equalTo: descr.bottomAnchor, constant: 10),
//            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
//            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
//            
                       addButton.topAnchor.constraint(equalTo: descr.bottomAnchor, constant: 4), // Reduced space
                       addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
                       addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
                       addButton.heightAnchor.constraint(equalToConstant: 30), // Set a fixed height for the button
                       addButton.widthAnchor.constraint(equalToConstant: 120),
            
            
            
            ratinglbl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            ratinglbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
           
           // ratinglbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -210),
            
            ratingView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            ratingView.leadingAnchor.constraint(equalTo: ratinglbl.leadingAnchor,constant: 16),
            ratingView.centerYAnchor.constraint(equalTo: ratinglbl.centerYAnchor),
          //  ratingView.centerXAnchor.constraint(equalTo: ratinglbl.centerXAnchor),
            
            
            
            
            
        ])
    }
    
//    func addToFavorites(_ sender: UIButton) {
////           let productIndex = sender.tag
////           guard let product = viewModel.products?.products[productIndex] else { return }
////
////           // Update local database to add the product to favorites
////        FavoriteManager.shared.addProductToFavorites(productId: product.id )
////           
////           // Reload the specific cell
////           collectionView.reloadItems(at: [IndexPath(row: productIndex, section: 0)])
//        
//        
//        
//        
//        
//       }
//       
    func loadImage(from urlString: String, for cell: BooksCell) {
        guard let imageURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                cell.bookImg.image = UIImage(data: data)
            }
        }.resume()
    }
    
    
    func configure(with title: String, price: String, rating: Double, reviews: Int, desc: String,isFavorite: Bool) {
            titleLabel.text = title
            priceLabel.text = price
            descr.text = desc
            ratinglbl.text = "\(rating)"
        FavoriteButton.isHidden = isFavorite

            ratingView.configure(rating: rating, reviews: reviews)
        }
}
