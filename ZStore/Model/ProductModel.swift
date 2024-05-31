//
//  ProductModel.swift
//  ZStore
//
//  Created by Vetha on 29/05/24.
//

struct ProductModel: Codable {
    let category: [Category]
    let cardOffers: [CardOffer]
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case category
        case cardOffers = "card_offers"
        case products
    }
}

// MARK: - CardOffer
struct CardOffer: Codable {
    let id: String
    let percentage: Int
    let cardName, offerDesc, maxDiscount: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, percentage
        case cardName = "card_name"
        case offerDesc = "offer_desc"
        case maxDiscount = "max_discount"
        case imageURL = "image_url"
    }
}

// MARK: - Category
struct Category: Codable {
    let id, name, layout: String
}

// MARK: - Product
struct Product: Codable {
    let id, name: String
    let rating: Double
    let reviewCount: Int
    let price: Double
    let categoryID: String
    let cardOfferIDS: [String]
    let imageURL: String
    let description: String
    let colors: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, rating
        case reviewCount = "review_count"
        case price
        case categoryID = "category_id"
        case cardOfferIDS = "card_offer_ids"
        case imageURL = "image_url"
        case description, colors
    }
}
