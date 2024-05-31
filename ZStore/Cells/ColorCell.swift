//
//  ColorCell.swift
//  ZStore
//
//  Created by Vetha on 29/05/24.
//

import UIKit

class ColorCell: UIView {
    
        // Color view representing the swatch
        let colorView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10 // Adjust the corner radius to change the circle size
            view.clipsToBounds = true
            return view
        }()
        
        // Array of colors for the swatches
        var colors: [UIColor] = [] {
            didSet {
                // Update colors when the array changes
                updateColors()
            }
        }
        
        // Index to track the current color
        private var currentIndex = 0
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
           
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Add color view to self
            addSubview(colorView)
            
            // Setup constraints for color view to fill self
            NSLayoutConstraint.activate([
//                colorView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                colorView.centerYAnchor.constraint(equalTo: centerYAnchor),
//                colorView.widthAnchor.constraint(equalToConstant: 20), // Adjust width as needed
//                colorView.heightAnchor.constraint(equalToConstant: 20) // Adjust height as needed
//                
//                
                
                colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
                colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                colorView.heightAnchor.constraint(equalToConstant: 20),
                colorView.widthAnchor.constraint(equalToConstant: 20)
                
            ])
            
            // Initialize with empty color array
            updateColors()
        }
        
        private func updateColors() {
            // Check if colors array is empty
            guard !colors.isEmpty else { return }
            
            // Update color of color view with the current color
            colorView.backgroundColor = colors[currentIndex]
            
            // Increment index for the next color
            currentIndex = (currentIndex + 1) % colors.count
        }
    }
