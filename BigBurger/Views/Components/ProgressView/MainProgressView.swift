//
//  MainProgressView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// View that populates the ``ProgressView`` with a transparent background.
struct MainProgressView: View {

  var isAnimating: Bool

  var body: some View {
    ZStack {
      if isAnimating {
        Color.systemGroupedBackground.opacity(0.75)
          .edgesIgnoringSafeArea(.all)
          .transition(.opacity)

        ProgressView()
          .scaleEffect(1.6)
          .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
      }
    }
  }
}

// MARK: - Previews
struct MainProgressView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MainProgressView(isAnimating: true)

      MainProgressView(isAnimating: false)
        .preferredColorScheme(.dark)
    }
  }
}

