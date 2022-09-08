//
//  ServerError.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Custom ``Error`` identifiers for api calls failure responses.
enum ServerError: String, Error, Equatable {

  case internalServerError
  case invalidResponse
  case unknown
}
