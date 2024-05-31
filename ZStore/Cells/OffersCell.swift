//
//  OffersCell.swift
//  ZStore
//
//  Created by Vetha on 27/05/24.
//

import UIKit

class OffersCell: UICollectionViewCell {
    

    
    var offerTitlelbl = UILabel()
    var offerEmIlbl = UILabel()
    var offerCashbacklbl = UILabel()
    
    
    
    lazy var myView: UIView = {
        let view = UIView()
     
        view.backgroundColor = .lightGray
      
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the myView to the cell's contentView
        contentView.addSubview(myView)
        contentView.addSubview(myImageView)
        contentView.addSubview(offerTitlelbl)
        contentView.addSubview(offerEmIlbl)
        contentView.addSubview(offerCashbacklbl)
        
       
//        let layer0 = CAGradientLayer()
//        layer0.colors = [
//          UIColor(red: 0.103, green: 0.495, blue: 0.855, alpha: 1).cgColor,
//          UIColor(red: 0.168, green: 0.82, blue: 1, alpha: 1).cgColor
//        ]
//        layer0.locations = [0, 1]
//        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
//        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
//        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: -1, c: 1, d: 0, tx: 0.5, ty: 1))
//        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
//        layer0.position = view.center
//        view.layer.addSublayer(layer0)
//
//        view.layer.cornerRadius = 20
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1).cgColor

     
        
        offerTitlelbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        offerTitlelbl.font = UIFont(name: "SFProText-Medium", size: 16)
        
        offerEmIlbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        offerEmIlbl.font = UIFont.boldSystemFont(ofSize: 13)
       
        offerEmIlbl.numberOfLines = 0
        offerEmIlbl.lineBreakMode = .byWordWrapping
        
        
        offerCashbacklbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        offerCashbacklbl.font = UIFont(name: "SFProText-Semibold", size: 20)
        
        
        offerTitlelbl.translatesAutoresizingMaskIntoConstraints = false
        offerEmIlbl.translatesAutoresizingMaskIntoConstraints = false
        offerCashbacklbl.translatesAutoresizingMaskIntoConstraints = false
       
        // Set up the contentView properties
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1).cgColor
        myView.layer.cornerRadius = 20
        
        // Set up constraints for myView
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        // Add constraints to position myView
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            myView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 85),
            myImageView.widthAnchor.constraint(equalToConstant: 85),
            
            
            
            offerTitlelbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            offerTitlelbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            offerTitlelbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            // offerTitlelbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            
            offerEmIlbl.topAnchor.constraint(equalTo: offerTitlelbl.topAnchor, constant: 30),
            offerEmIlbl.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: -90),
            offerEmIlbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            // offerTitlelbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            
            offerCashbacklbl.topAnchor.constraint(equalTo: offerEmIlbl.topAnchor, constant: 40),
            offerCashbacklbl.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: -90),
            offerCashbacklbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
          //  offerCashbacklbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        
        ])
    }
    func loadImage(from urlString: String, for cell: OffersCell) {
        guard let imageURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                cell.myImageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    func configure(with offerTitle: String, offerEmI: String, offerCashback: String) {
        offerTitlelbl.text = offerTitle
        offerEmIlbl.text = offerEmI
        offerCashbacklbl.text = offerCashback
        
    }
}
