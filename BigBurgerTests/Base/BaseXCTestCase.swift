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

  var urlSessionMock: URLSessionMock!
  var serverServiceMock: ServerServiceMock!

  override func setUpWithError() throws {
    try super.setUpWithError()
    urlSessionMock = URLSessionMock()
    serverServiceMock = ServerServiceMock(urlSession: urlSessionMock)
  }

  override func tearDownWithError() throws {
    serverServiceMock = .none
    urlSessionMock = .none
    try super.tearDownWithError()
  }
}
