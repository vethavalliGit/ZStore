//
//  RatingView.swift
//  ZStore
//
//  Created by Vetha on 29/05/24.
//

import UIKit

class RatingView: UIView {

    
       private let ratingLabel = UILabel()
       private var starImageViews: [UIImageView] = []
       
       init() {
           super.init(frame: .zero)
           setupViews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupViews() {
           ratingLabel.font = UIFont.systemFont(ofSize: 14)
           ratingLabel.textColor = .green
           ratingLabel.translatesAutoresizingMaskIntoConstraints = false
           
           addSubview(ratingLabel)
           
           for _ in 0..<5 {
               let imageView = UIImageView()
               imageView.image = UIImage(systemName: "star.fill")
               imageView.tintColor = .white
               imageView.translatesAutoresizingMaskIntoConstraints = false
               starImageViews.append(imageView)
               addSubview(imageView)
           }
           
           NSLayoutConstraint.activate([
               // Arrange the stars in a horizontal line
               starImageViews[0].leadingAnchor.constraint(equalTo: leadingAnchor),
               starImageViews[0].topAnchor.constraint(equalTo: topAnchor),
               starImageViews[0].widthAnchor.constraint(equalTo: self.widthAnchor, constant: 14),
               starImageViews[0].heightAnchor.constraint(equalTo: self.heightAnchor, constant: 5),
               
               starImageViews[1].leadingAnchor.constraint(equalTo: starImageViews[0].trailingAnchor, constant: 1),
               starImageViews[1].topAnchor.constraint(equalTo: topAnchor),
               starImageViews[1].widthAnchor.constraint(equalTo: self.widthAnchor, constant: 14),
               starImageViews[1].heightAnchor.constraint(equalTo: self.heightAnchor, constant: 5),
               
               starImageViews[2].leadingAnchor.constraint(equalTo: starImageViews[1].trailingAnchor, constant: 1),
               starImageViews[2].topAnchor.constraint(equalTo: topAnchor),
               starImageViews[2].widthAnchor.constraint(equalTo: self.widthAnchor, constant: 14),
               starImageViews[2].heightAnchor.constraint(equalTo: self.heightAnchor, constant: 5),
               
               starImageViews[3].leadingAnchor.constraint(equalTo: starImageViews[2].trailingAnchor, constant: 1),
               starImageViews[3].topAnchor.constraint(equalTo: topAnchor),
               starImageViews[3].widthAnchor.constraint(equalTo: self.widthAnchor, constant: 14),
               starImageViews[3].heightAnchor.constraint(equalTo: self.heightAnchor, constant: 5),
               
               starImageViews[4].leadingAnchor.constraint(equalTo: starImageViews[3].trailingAnchor, constant: 1),
               starImageViews[4].topAnchor.constraint(equalTo: topAnchor),
               starImageViews[4].widthAnchor.constraint(equalTo: self.widthAnchor, constant: 14),
               starImageViews[4].heightAnchor.constraint(equalTo: self.heightAnchor, constant: 5),
               
               // Align the rating label to the right of the stars
              // ratingLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
              ratingLabel.centerYAnchor.constraint(equalTo: starImageViews[4].centerYAnchor),
               ratingLabel.trailingAnchor.constraint(equalTo: starImageViews[4].trailingAnchor,constant: 40),
              // ratingLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 30),
               ratingLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 30),
           ])
       }
       
       func configure(rating: Double, reviews: Int) {
           let filledStars = Int(rating)
           for (index, imageView) in starImageViews.enumerated() {
               if index < filledStars {
                   imageView.tintColor = .orange
               } else {
                   imageView.tintColor = .gray
               }
           }
           ratingLabel.backgroundColor = .gray
           ratingLabel.text = "(\(reviews))"
           ratingLabel.textAlignment = .center
       }
   }


