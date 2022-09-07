//
//  HomeView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Home view to welcome the user with
/// a list of burgers.
struct HomeView: View {

  var body: some View {
    Text("HomeView")
  }
}

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      HomeView()

      HomeView()
        .preferredColorScheme(.dark)
    }
  }
}
