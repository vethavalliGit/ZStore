//
//  ProductViewModel.swift
//  ZStore
//
//  Created by Vetha on 29/05/24.
//
import Foundation
class ProductViewModel {
    var products: ProductModel?
    
    func fetchProducts(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/princesolomon/zstore/main/data.json") else {
            print("Invalid URL")
            return
        }
        print("apiurlllllllll")
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Failed to fetch products: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                self.products = try JSONDecoder().decode(ProductModel.self, from: data)
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
