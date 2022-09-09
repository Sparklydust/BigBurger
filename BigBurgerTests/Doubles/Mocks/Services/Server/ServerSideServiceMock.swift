//
//  ServerSideServiceMock.swift
//  BigBurgerTests
//
//  Created by Roland Lariotte on 08/09/2022.
//

import Foundation
@testable import BigBurger

final class ServerServiceMock: ServerProtocol {

  let urlRequestFake = URLRequest(url: URL(string: "https://fake.api.request.com")!)
  /// Faking blocking thread to catch up async call while running
  /// without ending its call.
  var onPerformAsyncAwait: () throws -> Void = {}

  let urlSessionMock: URLSessionProtocol

  init(urlSession: URLSessionProtocol) {
    urlSessionMock = urlSession
  }

  /// Return a fake list of two ``BurgerData``.
  func getBurgersCatalog() async throws -> [BurgerData] {
    try onPerformAsyncAwait()
    _ = try await urlSessionMock.data(for: urlRequestFake, delegate: .none)

    return [
      .fake(),
      .fake(
        id: "3",
        name: "The Big Bacon Burger",
        description: "It is nearly the same as The Big Cheese Burger as bacon is added. Beckoning!",
        imageURL: "https://bigburger.useradgents.com/images/3.png",
        unformattedPrice: 885)
    ]
  }
}
