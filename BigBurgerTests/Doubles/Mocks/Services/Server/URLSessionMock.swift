//
//  URLSessionMock.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation
@testable import BigBurger

/// Mock URLSession to send fake data for unit test.
final class URLSessionMock: URLSessionProtocol {

  var data: Data?
  var response: URLResponse?
  var error: ServerError?

  init(data: Data? = .none,
       response: URLResponse? = .none,
       error: ServerError? = .none) {
    self.data = data
    self.response = response
    self.error = error
  }

  func data(
    for request: URLRequest,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse) {

    // Check first if fake error must be thrown for tests.
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode)
    else { throw error ?? .unknown }

    // If no error, return fake data for tests.
    guard let data = data, let response = response
    else { throw error ?? .unknown }

    return (data, response)
  }
}

