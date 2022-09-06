//
//  BaseXCTestCase.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 06/09/2022.
//

import XCTest
@testable import BigBurger

/// Holds all mocks, spies and fakes data needed for the tests.
///
/// By adding the ``BaseXCTestCase`` as an extension to tests class,
/// we can avoid duplications and retrieve in one place all the
/// mocks, spies and fake data.
class BaseXCTestCase: XCTestCase {

  override func setUpWithError() throws {
    try super.setUpWithError()
    // Intentionally empty
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
    // Intentionally empty
  }
}
