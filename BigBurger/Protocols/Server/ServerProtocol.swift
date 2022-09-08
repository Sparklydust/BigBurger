//
//  ServerProtocol.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Server side api calls definitions that are needed for
/// the BigBurger application.
protocol ServerProtocol {

  /// Intializer to pass ``URLSession`` as a protocol
  /// to inject a mock during Unit Tests.
  /// - Parameter urlSession: The main ``URLSession``
  /// tool from the ``Foundation`` framework.
  init(urlSession: URLSessionProtocol)

  /// Fetch the catalog of burgers as a list from the BigBurgerServer.
  ///
  /// These are the burgers that the restaurant are
  /// selling. The server is updated following the
  /// restaurant provisions.
  /// - Warning: This call must be refreshed at least
  /// each days to users for them to have the latest
  /// available burgers.
  /// - Returns: List of burgers data.
  func getBurgersCatalog() async throws -> [BurgerData]
}
