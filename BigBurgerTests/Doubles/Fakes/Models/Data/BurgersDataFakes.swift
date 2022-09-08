//
//  BurgersDataFakes.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

// MARK: - BigBurgerData
extension BurgerData {

  /// Fake data for unit tests.
  static func fake(
    id: String = "2",
    name: String = "The Big Cheese Burger",
    description: String = "It is always tastier with cheese.",
    imageURL: String = "https://bigburger.useradgents.com/images/2.png",
    unformattedPrice: Int = 830
  ) -> BurgerData {

    return BurgerData(
      id: id,
      name: name,
      description: description,
      imageURL: imageURL,
      unformattedPrice: unformattedPrice
    )
  }
}
