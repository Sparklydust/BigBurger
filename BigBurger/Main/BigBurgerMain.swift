//
//  BigBurgerMain.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Main entry point at the BigBurger application at startup.
///
/// ``BigBurgerMain`` check if the application is running tests to
/// bypass ``BigBurgerApp`` and run the ``BigBurgerAppTests``
/// instead to take control of the Application launch and
/// avoid running instances when initialized.
@main
struct BigBurgerMain {

  static func main() throws {
    guard NSClassFromString("XCTestCase") == nil else {
      BigBurgerAppTests.main()
      return
    }
    BigBurgerApp.main()
  }
}
