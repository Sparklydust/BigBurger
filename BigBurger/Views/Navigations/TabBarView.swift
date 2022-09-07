//
//  TabBarView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// iOS classic tab bar definition with main
/// features as tab items.
struct TabBarView: View {

  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Text("Home")
          Image(systemName: "house")
        }

      CartView()
        .tabItem {
          Text("Cart")
          Image(systemName: "cart")
        }
    }
  }
}


// MARK: - Previews
struct TabBarView_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      TabBarView()

      TabBarView()
        .preferredColorScheme(.dark)
    }
    .previewDevice("iPhone 13 Pro")
  }
}
