//
//  BurgerLargeCell.swift
//  BigBurger
//
//  Created by Roland Lariotte on 09/09/2022.
//

import SwiftUI

/// Cell populating all the informations that a burger
/// can have.
struct BurgerLargeCell: View {

  var burger: BurgerLocal
  var action: () -> Void

  var body: some View {
    HStack(spacing: 4) {

      AsyncImageView(imageURL: burger.imageURL)

      VStack(alignment: .leading, spacing: 4) {
        Text(burger.name)
          .font(.title2)
          .bold()

        Text(burger.description)

        Spacer()

        PriceCardButton(price: burger.price, action: action)
      }
      Spacer()
    }
    .frame(height: 120)
  }
}

struct BurgerLargeCell_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      BurgerLargeCell(burger: .init(data: .fixture()), action: {})

      BurgerLargeCell(burger: .init(data: .fixture()), action: {})
        .preferredColorScheme(.dark)
    }
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
