//
//  BigBurgerAppTests.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Unit Testing entry point to run the BigBurger application.
///
/// This struct is used when triggering the system under tests and
/// not in production, which would bypass the ``BigBurgerApp``
/// application entry point.
struct BigBurgerAppTests: App {

  var body: some Scene {
    WindowGroup { EmptyView() }
  }
}
