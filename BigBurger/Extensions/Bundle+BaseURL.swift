//
//  Bundle.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation

extension Bundle {

  /// Base url to reach the BigBurgerServer.
  ///
  /// URLs for the Development and Production schemes can
  /// be found under the Configurations/Configs files.
  var baseURL: String {
    return object(forInfoDictionaryKey: "BIGBURGER_SERVER_BASE_URL") as! String
  }
}
