//
//  ProductCell.swift
//  ZStore
//
//  Created by Vetha on 25/05/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseIdentifier = "ProductCell"
    //
    
       
//    private var colorSwatchesView : ColorCell!
       
    
    let multiColorSwatchView: ColorCell = {
         let view = ColorCell()
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
    
    
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let priceLabel2 = UILabel()
    let deliverylbl = UILabel()
    let viewImg = UIView()
    
    let productImg = UIImageView()
    
    let ratingView = UIView()
    let ratinglbl = UILabel()
    let saveView = UIView()
    
    let savelbl = UILabel()
    
    let ratingView2 = RatingView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupViewscolor()
        //contentView.backgroundColor = .black
        
      
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        deliverylbl.translatesAutoresizingMaskIntoConstraints = false
        viewImg.translatesAutoresizingMaskIntoConstraints = false
        productImg.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratinglbl.translatesAutoresizingMaskIntoConstraints = false
        priceLabel2.translatesAutoresizingMaskIntoConstraints = false
        saveView.translatesAutoresizingMaskIntoConstraints = false
//        ColorButton.translatesAutoresizingMaskIntoConstraints = false
//        ColorButton2.translatesAutoresizingMaskIntoConstraints = false
//        ColorButton3.translatesAutoresizingMaskIntoConstraints = false
        savelbl.translatesAutoresizingMaskIntoConstraints = false
        
//        ColorButton.layer.cornerRadius = 10
//        ColorButton2.layer.cornerRadius = 10
//        ColorButton3.layer.cornerRadius = 10
        
       
        savelbl.text = "Save ₹2,000"
        savelbl.font = UIFont.systemFont(ofSize: 8)
        
        
        
        saveView.layer.backgroundColor = UIColor(red: 0.082, green: 0.549, blue: 0.357, alpha: 1).cgColor
        saveView.layer.cornerRadius = 10

        
        // ratinglbl.backgroundColor = .black
//        priceLabel.backgroundColor = .brown
//        // nameLabel.backgroundColor = .green
//        deliverylbl.backgroundColor = .lightGray
//        ratingView.backgroundColor = .blue
        //  productImg.backgroundColor = .blue
       // ratinglbl.text = "4.3"
        //deliverylbl.text = "fe"
              //  priceLabel2.backgroundColor = .systemBlue
        
       
//        ColorButton.backgroundColor = .brown
//        ColorButton2.backgroundColor = .gray
//        ColorButton3.backgroundColor = .red
//        
//  
     
       
        
        contentView.addSubview(productImg)
        //  contentView.addSubview(viewImg)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceLabel2)
        contentView.addSubview(deliverylbl)
        
        contentView.addSubview(ratingView)
        contentView.addSubview(ratinglbl)
        contentView.addSubview(saveView)
//        contentView.addSubview(ColorButton)
//        contentView.addSubview(ColorButton2)
//        contentView.addSubview(ColorButton3)
        contentView.addSubview(savelbl)
        
      
        

        
        NSLayoutConstraint.activate([
            
            
            //  productImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            productImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            productImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -250),
            //  productImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            productImg.heightAnchor.constraint(equalToConstant: 100),
            productImg.widthAnchor.constraint(equalToConstant: 90),
            
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: productImg.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            
            
            ratinglbl.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            ratinglbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            ratinglbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -210),
            
            priceLabel.topAnchor.constraint(equalTo: ratinglbl.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -160),
            
            //   priceLabel2.topAnchor.constraint(equalTo: ratinglbl.bottomAnchor, constant: 4),
            priceLabel2.leadingAnchor.constraint(equalTo: ratinglbl.trailingAnchor, constant: 70),
            priceLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            priceLabel2.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -0),
            
            
            saveView.leadingAnchor.constraint(equalTo: priceLabel2.leadingAnchor, constant: 80),
            saveView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -65),
            saveView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            saveView.heightAnchor.constraint(equalToConstant: 20),
            saveView.widthAnchor.constraint(equalToConstant: 100),
            
            savelbl.leadingAnchor.constraint(equalTo: saveView.leadingAnchor, constant: 5),
            savelbl.bottomAnchor.constraint(equalTo: saveView.bottomAnchor, constant: -5),
            savelbl.trailingAnchor.constraint(equalTo: saveView.trailingAnchor, constant: -5),
            savelbl.heightAnchor.constraint(equalToConstant: 10),
            savelbl.widthAnchor.constraint(equalToConstant: 10),
            
            
            
            //savelbl.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0),
            
            
            //            ratinglbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -410),
            //            ratinglbl.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            //            ratinglbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
            //
            //            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            //            ratingView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ),
            //           // ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //                    ratingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            //            ratingView.heightAnchor.constraint(equalToConstant: 100),
            //            ratingView.widthAnchor.constraint(equalToConstant: 100)
            
            
            
            //            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            //            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            //            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //
            //            deliverylbl.topAnchor.constraint(equalTo: priceLabel2.bottomAnchor, constant: 4),
            //            deliverylbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            //            deliverylbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //            deliverylbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            //
            
            deliverylbl.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            deliverylbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            deliverylbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            
            
//                ColorButton.leadingAnchor.constraint(equalTo: productImg.leadingAnchor, constant: 120),
//                ColorButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
//                ColorButton.heightAnchor.constraint(equalToConstant: 20),
//                ColorButton.widthAnchor.constraint(equalToConstant: 20),
//            
//            
//            ColorButton2.leadingAnchor.constraint(equalTo: ColorButton.leadingAnchor, constant: 25),
//            ColorButton2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
//            ColorButton2.heightAnchor.constraint(equalToConstant: 20),
//            ColorButton2.widthAnchor.constraint(equalToConstant: 20),
//            
//            ColorButton3.leadingAnchor.constraint(equalTo: ColorButton2.leadingAnchor, constant: 25),
//            ColorButton3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
//            ColorButton3.heightAnchor.constraint(equalToConstant: 20),
//            ColorButton3.widthAnchor.constraint(equalToConstant: 20)
//            
//   
            
        ])
    }

    
    func loadImage(from urlString: String, for cell: ProductCell) {
        guard let imageURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                cell.productImg.image = UIImage(data: data)
               
                cell.productImg.layer.borderWidth = 1
                cell.productImg.layer.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1).cgColor
                cell.productImg.layer.cornerRadius = 20
                
            }
        }.resume()
    }
    func setColors(_ colors: [UIColor]) {
          // Set colors for multi-color swatch view
          multiColorSwatchView.colors = colors
      }
      
    private func setupViewscolor() {
          // Add multi-color swatch view to cell's content view
          contentView.addSubview(multiColorSwatchView)
          
          // Setup constraints for multi-color swatch view to fill cell
          NSLayoutConstraint.activate([
              multiColorSwatchView.topAnchor.constraint(equalTo: contentView.topAnchor),
              multiColorSwatchView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              multiColorSwatchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              multiColorSwatchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
          ])
      }
    func configure(with name: String, price: String, rating: Double, reviews: Int, desc: String) {
        nameLabel.text = name
            priceLabel.text = price
            priceLabel2.text = desc
            ratinglbl.text = "\(rating)"
        ratingView2.configure(rating: rating, reviews: reviews)
        }
    
    
}
