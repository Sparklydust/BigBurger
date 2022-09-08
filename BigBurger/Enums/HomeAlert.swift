//
//  HomeAlert.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

/// Alert that can be triggered from the
/// ``HomeViewModel``.
enum HomeAlert {

  case serverError
  case unknown

  // The title of the triggered alert.
  var title: String {
    switch self {
    case .serverError:
      return "Oops! Server Failure"
    case .unknown:
      return "Unknown Error"
    }
  }

  // The message of the triggered alert.
  var message: String {
    switch self {
    case .serverError:
      return "Tastiest burgers could not be fetched from the server. \nPlease, try again later. "
    case .unknown:
      return "Please, contact us to help you out on this one."
    }
  }
}
