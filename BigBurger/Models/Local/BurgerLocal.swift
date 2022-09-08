//
//  BurgerLocal.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Burger local object mapped with the ``BurgerData``
/// from server requests.
struct BurgerLocal {

  let id: Int
  let name: String
  let description: String
  let imageURL: String
  let price: String

  init(data: BurgerData) {
    self.id = Int(data.id) ?? .zero
    self.name = data.name
    self.description = data.description
    self.imageURL = data.imageURL
    self.price = data.unformattedPrice
      .formatted(.currency(code: "EUR"))
  }
}
