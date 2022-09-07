//
//  SideBarView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Sidebar items for iPadOS navigation.
struct SideBarView: View {

  var body: some View {
    Text("SideBarView")
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
