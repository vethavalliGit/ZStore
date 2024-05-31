//
//  CategoryCell.swift
//  ZStore
//
//  Created by Vetha on 25/05/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let nametext = UILabel()
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        contentView.addSubview(nametext)
        
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 24
        contentView.layer.borderWidth = 1.5
        
       
        contentView.layer.borderColor = UIColor.gray.cgColor
      
        nametext.sizeToFit()
     
        nametext.textColor = UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)
        nametext.font = UIFont(name: "SFProText-Medium", size: 15)
        nametext.textAlignment = .center
        
        nametext.translatesAutoresizingMaskIntoConstraints = false
        //  nametext.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
        //self.nametext.backgroundColor = .green
        NSLayoutConstraint.activate([
            //            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            //            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            //            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //  self.nametext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: ),
            //self.nametext.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            //                  self.nametext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 2),
            self.nametext.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.nametext.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.nametext.heightAnchor.constraint(equalToConstant: 20),
            self.nametext.widthAnchor.constraint(equalToConstant: 60),
           
        ])
    }
    
    func configure(with name: String) {
        nametext.text = name
       
        }
    func calculateWidth(for text: String) -> CGFloat {
           let nametext = UILabel()
        nametext.text = text
        nametext.sizeToFit()
           return nametext.frame.width + 100 // Add some padding
       }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
