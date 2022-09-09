//
//  BurgerData.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Burger data that can be fetched from the server.
/// - Warning: The received price is not formatted.
struct BurgerData: Codable {

  let id: String
  let name: String
  let description: String
  let imageURL: String
  let unformattedPrice: Int

  enum CodingKeys: String, CodingKey {
    case id = "ref"
    case name = "title"
    case description
    case imageURL = "thumbnail"
    case unformattedPrice = "price"
  }
}
