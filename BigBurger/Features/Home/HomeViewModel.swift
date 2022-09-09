//
//  HomeViewModel.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

  // MARK: Local Objects
  @Published var burgersCatalog: [BurgerLocal] = []

  // MARK: UI Levers
  @Published var isLoading = false
  @Published var homeAlert: HomeAlert = .unknown
  @Published var showAlert = false

  var serverService: ServerProtocol

  init(serverService: ServerProtocol = ServerService()) {
    self.serverService = serverService
  }
}

// MARK: - Alerts
extension HomeViewModel {

  /// Trigger alert during for the ``HomeView``.
  /// - Parameter alert: OnboardingAlert related to the user action.
  @MainActor func triggerAlert(_ alert: HomeAlert) {
    homeAlert = alert
    showAlert = true
  }

}

// MARK: - CustomProgressView
extension HomeViewModel {
  /// Trigger or not the custom progress view from the isLoading publisher.
  /// - Parameter action: true or false to trigger the progress view.
  func progressView(isShown: Bool) {
    withAnimation(.easeInOut) { isLoading = isShown }
  }
}

// MARK: - ServerService
extension HomeViewModel {

  /// Fetch from the server the list of burgers available
  /// at the restaurant menu.
  @MainActor func getBurgersCatalog() async {
    progressView(isShown: true)
    defer { progressView(isShown: false) }

    do {
      let data = try await serverService.getBurgersCatalog()
      burgersCatalog = data.compactMap { BurgerLocal(data: $0) }
    }
    catch { triggerAlert(.serverError) }
  }
}
