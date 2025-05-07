//
//  ContentView.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 19/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @EnvironmentObject var container : DependencyContainer
    
    private let screens = AppScreens.allCases
    
    private var currentScreen : AppScreens = AppScreens.home
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeScreen(viewModel: container.makeHomeViewModel(), onNavigateToDetail: { numberDocument in
                path.append(AppRoute.detail(documentNumber: numberDocument))
            })
            .navigationDestination(for: AppRoute.self){ route in
                switch route {
                case .detail(documentNumber: _):
                    DetailScreen(
                        viewModel: container.makeDetailViewModel()
                    )
                case .home:
                    HomeScreen(
                        viewModel: container.makeHomeViewModel()
                    ) { numberDocument in
                        path.append(AppRoute.detail(documentNumber: numberDocument))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let container = DependencyContainer()
        ContentView()
            .environmentObject(container)
    }
}
