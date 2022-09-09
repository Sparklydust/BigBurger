//
//  PriceCardButton.swift
//  BigBurger
//
//  Created by Roland Lariotte on 09/09/2022.
//

import SwiftUI

/// Populate a price with a card rounded button
/// in a small format.
struct PriceCardButton: View {

  var price: String
  var action: () -> Void

  var body: some View {
    HStack(spacing: 16) {

      Spacer()

      Text(price)
        .font(.headline)
        .foregroundColor(.accentColor)

      Button(action: action) {
        Image(systemName: "cart")
          .foregroundColor(.white)
          .padding(8)
          .background(Color.accentColor)
          .clipShape(Circle())
      }
    }
  }
}

// MARK: - Previews
struct PriceCardButton_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      PriceCardButton(price: "6.41€", action: {})

      PriceCardButton(price: "8.12€", action: {})
        .preferredColorScheme(.dark)
    }
  }
}
