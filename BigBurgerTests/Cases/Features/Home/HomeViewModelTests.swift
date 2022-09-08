//
//  HomeViewModelTests.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import XCTest
@testable import BigBurger

class HomeViewModelTests: BaseXCTestCase {

  var sut: HomeViewModel!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = HomeViewModel(serverService: serverServiceMock)
  }

  override func tearDownWithError() throws {
    sut = .none
    try super.tearDownWithError()
  }
}

// MARK: - ServerService
extension HomeViewModelTests {

  @MainActor func testServerService_successfulServerCallOnBurgersCatalogEndpoint_burgersCatalogCountIsEqualToTwo() async throws {
    let expected = 2
    sut.serverService = try serverServiceMock(.burgersData, response: 200)
    sut.burgersCatalog = []

    await sut.getBurgersCatalog()
    let result = sut.burgersCatalog.count

    XCTAssertEqual(result, expected, "The burgers catalog must have `\(expected)` burgers on a successful server request.")
  }

  @MainActor func testServerService_burgersCatalogIsBeingRequestedFromServer_isLoadingIsTrueAndProgressViewIsSpinning() async {
    sut.isLoading = false

    serverServiceMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      XCTAssertTrue(result, "isLoading must be true so progress view is spinning when user waits for server request.")
    }
    await sut.getBurgersCatalog()
  }
}
