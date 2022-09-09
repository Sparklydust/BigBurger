//
//  ServerEndpoint.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// URL path definition that send the user request to the BigBurgerServer.
/// ```
/// ServerEndpoint.burgersCatalog.url  // example of user
/// ```
enum ServerEndpoint {

  /// Base url to reach the BigBurgerServer.
  static let baseURL = URL(string: Bundle.main.baseURL)!

  /// Fetch a list of ``BurgerData``.
  case burgersCatalog

  /// Server side endpoint.
  var url: URL {
    switch self {
      case .burgersCatalog:
        return urlPath(to: "bigburger")
    }
  }
}

// MARK: - Endpoint Path
extension ServerEndpoint {

  /// Create the full url path to the BigBurgerServer with its endpoint
  /// set in the parameter.
  /// - Parameter endpoint: The endpoint where the data is requested.
  /// - Returns: The full BigBurgerServer url.
  func urlPath(to endpoint: String) -> URL {
    ServerEndpoint.baseURL.appendingPathComponent(endpoint)
  }
}
