//
//  ContentView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 06/09/2022.
//

import SwiftUI

/// Root for iOS and iPadOS navigations.
///
/// The iPhone devices would use a classic
/// tab bar and the iPad ones would use
/// the a sidebar navigation.
struct ContentView: View {

  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var body: some View {
    if horizontalSizeClass == .compact {
      TabBarView()
    }
    else {
      SideBarView()
    }
  }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ContentView()

      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}
