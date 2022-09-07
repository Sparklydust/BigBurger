//
//  SideBarView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Sidebar items for iPadOS navigation.
///
/// SceneStorage is used for iPads navigations
/// when multiple windows are opened.
struct SideBarView: View {

  @SceneStorage("selectedView")
  var sideBarSelection: String?

  // MARK: - Body
  var body: some View {
    NavigationView {
      sidebar

      HomeView()
    }
  }

  // MARK: - Sidebar
  var sidebar: some View {
    List(selection: $sideBarSelection) {

      NavigationLink(destination: HomeView()) {
        Label(
          title: { Text("Home") },
          icon: {
            Image(systemName: "house")
              .font(.headline)
              .imageScale(.medium)
          }
        )
      }

      NavigationLink(destination: CartView()) {
        Label(
          title: { Text("Cart") },
          icon: {
            Image(systemName: "cart")
              .font(.headline)
              .imageScale(.medium)
          }
        )
      }
    }
  }
}

// MARK: - Previews
struct SideBarView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      SideBarView()

      SideBarView()
        .preferredColorScheme(.dark)
    }
    .previewDevice("iPad Pro (9.7-inch)")
  }
}
