//
//  HomeView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 08/09/2022.
//

import SwiftUI

/// Home view to welcome the user with
/// a list of burgers.
struct HomeView: View {

  @StateObject var vm = HomeViewModel()

  var body: some View {
    NavigationView {
      ZStack {

        List(vm.burgersCatalog, id: \.id) { burger in
          BurgerLargeCell(burger: burger, action: {})
            .buttonStyle(.plain)
        }

        MainProgressView(isAnimating: vm.isLoading)
      }
      .navigationTitle("Home")
      .task { await vm.getBurgersCatalog() }
      .alert(
        vm.homeAlert.title,
        isPresented: $vm.showAlert,
        actions: {},
        message: { Text(vm.homeAlert.message) }
      )
    }
  }
}

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      HomeView()

      HomeView()
        .preferredColorScheme(.dark)
    }
  }
}
