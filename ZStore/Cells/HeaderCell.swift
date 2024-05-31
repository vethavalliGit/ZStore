//
//  HeaderCell.swift
//  ZStore
//
//  Created by Vetha on 28/05/24.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    static let reuseIdentifier = "HeaderCell"
    let titleLbl = UILabel()
    var iconImageView = UIImageView()
    var offerImageView = UIImageView()
    var cleariconImg = UIImageView()
    
    var offerview = UIView()
    var clrBtn = UIButton()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        offerImageView.translatesAutoresizingMaskIntoConstraints = false
        offerview.translatesAutoresizingMaskIntoConstraints = false
        clrBtn.translatesAutoresizingMaskIntoConstraints = false
      
        self.addSubview(titleLbl)
        self.addSubview(iconImageView)
        self.addSubview(offerImageView)
        self.addSubview(cleariconImg)
        self.addSubview(offerview)
        self.addSubview(clrBtn)
        
        
        
        let text = "Applied: Hdf Bank Credit card"
        let attributedString = NSMutableAttributedString(string: text)

        // Set the color for "Applied:"
        let appliedRange = (text as NSString).range(of: "Applied:")
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: appliedRange)

        // Set the color for "Hdf Bank Credit card"
        let creditCardRange = (text as NSString).range(of: "Hdf Bank Credit card")
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: creditCardRange)

        titleLbl.attributedText = attributedString
        titleLbl.layer.borderColor = UIColor(red: 0.133, green: 0.416, blue: 0.706, alpha: 1).cgColor
        titleLbl.layer.borderWidth = 1
        titleLbl.layer.cornerRadius = 20
        titleLbl.textColor = UIColor(red: 0.133, green: 0.416, blue: 0.706, alpha: 1)
        titleLbl.font = UIFont(name: "SFProText-Medium", size: 15)
        titleLbl.textAlignment = .center
        
        let image = UIImage(named: "clear_img") as UIImage?
        
        clrBtn.setImage(image, for: .normal)
        

        
        
        
        
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            
            iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:  -10),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            
            
            
            offerImageView.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor, constant: -20),
            offerImageView.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor),
            offerImageView.widthAnchor.constraint(equalToConstant: 15),
            offerImageView.heightAnchor.constraint(equalToConstant: 15),
    
            
            cleariconImg.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor, constant: -20),
            cleariconImg.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor),
            cleariconImg.widthAnchor.constraint(equalToConstant: 15),
            cleariconImg.heightAnchor.constraint(equalToConstant: 15),
            
            offerview.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            offerview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            offerview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
            offerview.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 250),
            
            titleLbl.topAnchor.constraint(equalTo: self.offerview.topAnchor, constant: 10),
            titleLbl.leadingAnchor.constraint(equalTo: self.offerview.leadingAnchor, constant: 100),
            titleLbl.bottomAnchor.constraint(equalTo: self.offerview.bottomAnchor, constant: 0),
            titleLbl.trailingAnchor.constraint(equalTo: self.offerview.trailingAnchor, constant: 70),
            
            clrBtn.topAnchor.constraint(equalTo: self.titleLbl.topAnchor, constant: 10),
            clrBtn.leadingAnchor.constraint(equalTo: self.titleLbl.trailingAnchor, constant: 40),
            clrBtn.bottomAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: -10),
            clrBtn.trailingAnchor.constraint(equalTo: self.offerview.trailingAnchor, constant: 70),
            clrBtn.widthAnchor.constraint(equalToConstant: 35),
            clrBtn.heightAnchor.constraint(equalToConstant: 35)
            
            
        ])
    }
    
}
