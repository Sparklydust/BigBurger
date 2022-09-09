//
//  ServerService.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Server side service that is responsible to fetch data asynchronously.
final class ServerService: ServerProtocol {

  var urlSession: URLSessionProtocol

  init(urlSession: URLSessionProtocol = URLSession.shared) {
    self.urlSession = urlSession
  }
}

// MARK: - Burgers Catalog
extension ServerService {

  func getBurgersCatalog() async throws -> [BurgerData] {
    let urlRequest = URLRequest(url: ServerEndpoint.burgersCatalog.url)

    return try await serverSideCall(for: [BurgerData].self, on: urlRequest)
  }
}

// MARK: - Session Call
extension ServerService {
  /// Server request data through the api request, or an error if failed.
  ///
  /// Used to fetch any data from the database using the needed url request.
  /// - Parameters:
  ///   - data: The data object that will be send or fetch from api.
  ///   - urlRequest: The url request that will perform the data request.
  /// - Returns: The desired data set in the data: T.Type place.
  private func serverSideCall<T: Codable>(
    for data: T.Type,
    on urlRequest: URLRequest
  ) async throws -> T {

    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    let validatedData = try validate(data, response)
    let request = try JSONDecoder().decode(T.self, from: validatedData)

    return request
  }
}

// MARK: - Request Response
extension ServerService {
  /// Validation of the response coming from the api call.
  ///
  /// Catch up status code response for its validation or
  /// throw a ``ServerError``.
  /// - Parameters:
  ///   - data: Data coming from the api call if successful.
  ///   - response: HTTP response code to handle api errors.
  /// - Throws: ServerSideError from server.
  /// - Returns: Data if success or a ServerSideError.
  private func validate(
    _ data: Data,
    _ response: URLResponse
  ) throws -> Data {

    guard let httpResponse = response as? HTTPURLResponse
    else { throw ServerError.invalidResponse }

    guard httpResponse.statusCode < 500
    else { throw ServerError.internalServerError }

    guard (200..<300).contains(httpResponse.statusCode)
    else { throw ServerError.unknown }

    return data
  }
}

