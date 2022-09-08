//
//  ServerEndpointTests.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import XCTest
@testable import BigBurger

class ServerEndpointTests: XCTestCase {

  // MARK: Burgers Catalog
  func testBurgersCatalog_burgersCatalogURL_returnssignUpPasskeyEndpointURL() {
    let expected = URL(string: "https://bigburger.useradgents.com/catalog")!

    let result = ServerEndpoint.burgersCatalog.url

    XCTAssertEqual(result, expected)
  }
}
