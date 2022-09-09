//
//  BurgerDataFixture.swift
//  BigBurger
//
//  Created by Roland Lariotte on 09/09/2022.
//

// MARK: - BigBurgerData
extension BurgerData {

  /// Fixture data for SwiftUI previews.
  static func fixture(
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
