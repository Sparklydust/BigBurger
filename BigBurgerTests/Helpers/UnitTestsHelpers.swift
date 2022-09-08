//
//  UnitTestsHelpers.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation
import XCTest
@testable import BigBurger

// MARK: - Data+JsonFile
extension XCTestCase {
  /// Retrieve de json file from the Fakes/Jsons folder to pass fake
  /// server side data in unit tests.
  /// - Parameter fake: The name of the json file found in Fakes/Json.
  /// - Returns: The json model as data.
  func json(fake named: JsonFileName) throws -> Data {
    let bundleURL = try XCTUnwrap(
      Bundle(for: type(of: self))
        .url(forResource: named.rawValue, withExtension: "json")
    )
    return try Data(contentsOf: bundleURL)
  }
}

// MARK: - HTTPURLResponse+StatusCode
extension XCTestCase {
  /// Send a status code through ServerSide mocks to mimic an api response.
  /// - Parameter code: Fake Error Status Code that could have been sent
  /// from the ServerSide.
  /// - Returns: Fake url response with the added status code.
  func status(code: Int) -> HTTPURLResponse {
    return HTTPURLResponse(
      url: URL(string: "https://fake.api.request.com")!,
      statusCode: code,
      httpVersion: .none,
      headerFields: .none)!
  }
}

// MARK: - URLSessionMock+Setup
extension XCTestCase {

  /// Mock a server call with all needed parameters to
  /// create a fake api call response for ``ServerServiceMock``.
  /// ```swift
  /// // example of use to fake an api response in a test.
  /// sut.serverService = try serverServiceMock(
  ///   .burgersCatalog,
  ///   response: 500,
  ///   error: .fake()
  /// )
  /// ```
  /// - Parameters:
  ///   - data: The fake data that is expected to come back from the
  ///   fake api call for tests, found in the `JsonFileName.swift` file.
  ///   as a result of the fake api call.
  ///   - response: The fake api response that is needed for the Unit Tests.
  ///   - error: A fake ``ServerError`` if needed to test an error from a server response.
  /// - Returns: A fake ``ServerServiceMock`` to initialized a `sut.serverService`
  /// object for faking a server call response for unit tests.
  func serverServiceMock(
    _ data: JsonFileName,
    response: Int,
    error: ServerError? = .none
  ) throws -> ServerServiceMock {

    let data = try json(fake: data)
    let response = status(code: response)

    let urlSessionMock = URLSessionMock(
      data: data,
      response: response,
      error: error
    )

    return ServerServiceMock(urlSession: urlSessionMock)
  }
}
