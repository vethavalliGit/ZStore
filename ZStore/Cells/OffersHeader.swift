//
//  OffersHeader.swift
//  ZStore
//
//  Created by Vetha on 30/05/24.
//

import UIKit

class OffersHeader: UICollectionReusableView {
    let titleLbl = UILabel()
    var iconImageView = UIImageView()
    var offerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview(titleLbl)
        addSubview(offerImageView)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        offerImageView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
       titleLbl.text = "Offers"
        
          titleLbl.font = UIFont(name: "SFProText-Semibold", size: 18)
        titleLbl.textColor = UIColor(red: 0.902, green: 0.337, blue: 0.059, alpha: 1)
                    
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            titleLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            
            offerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            offerImageView.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor),
            offerImageView.widthAnchor.constraint(equalToConstant: 15),
            offerImageView.heightAnchor.constraint(equalToConstant: 15),
            
            
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
