//
//  SearchHeaderCell.swift
//  ZStore
//
//  Created by gokul on 29/05/24.
//

import UIKit

class SearchHeaderCell: UICollectionReusableView, UISearchBarDelegate {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Zstore"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        // let iconImageView = UIImage(named: "microscope")
      //
      //        let imageName = "microscope"
      //        let image = UIImage(named: imageName)
      //        let iconImageView = UIImageView(image: image!)
        
        let image = UIImage(named: "microscope") as UIImage?
        image?.withTintColor(.black)
    
        button.setImage(image, for: .normal)
       // button.backgroundColor = .systemBlue
       
        return button
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isHidden = true
        searchBar.showsCancelButton = true
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.layer.borderWidth = 0.5
        searchBar.searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(filterButton)
        addSubview(searchBar)
        searchBar.backgroundColor = .clear
        searchBar.delegate = self
       
        // Setup constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            filterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            filterButton.heightAnchor.constraint(equalToConstant: 45),
            filterButton.widthAnchor.constraint(equalToConstant: 45),
            
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            searchBar.heightAnchor.constraint(equalToConstant: 35),
            searchBar.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func filterButtonTapped() {
        titleLabel.isHidden = !titleLabel.isHidden
        searchBar.isHidden = !searchBar.isHidden
        if !searchBar.isHidden {
            searchBar.becomeFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        titleLabel.isHidden = false
        searchBar.isHidden = true
       
        searchBar.resignFirstResponder()
    }
}
