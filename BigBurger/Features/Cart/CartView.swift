//
//  CartView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Populate the burgers that the user
/// would like to buy.
struct CartView: View {

  var body: some View {
    Text("CartView")
  }
}

// MARK: - Previews
struct CartView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      CartView()

      CartView()
        .preferredColorScheme(.dark)
    }
  }
}
