//
//  FavoriteManager.swift
//  ZStore
//
//  Created by Vetha on 30/05/24.
//

import Foundation
class FavoriteManager {
    static let shared = FavoriteManager()
    private let favoritesKey = "favorites"
    
    private init() {}
    
    func addProductToFavorites(productId: String) {
        var favorites = getFavorites()
        favorites.insert(productId)
        saveFavorites(favorites)
    }
    
    func removeProductFromFavorites(productId: String) {
        var favorites = getFavorites()
        favorites.remove(productId)
        saveFavorites(favorites)
    }
    
    func isProductFavorite(productId: String) -> Bool {
        let favorites = getFavorites()
        return favorites.contains(productId)
    }
    
    private func getFavorites() -> Set<String> {
        if let favorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            return Set(favorites)
        }
        return []
    }
    
    private func saveFavorites(_ favorites: Set<String>) {
        UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
    }
}
