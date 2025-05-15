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
            HomeRoot(viewModel: container.makeHomeViewModel(), onNavigateToDetail: { numberDocument in
                path.append(AppRoute.detail(documentNumber: numberDocument))
            })
            .navigationDestination(for: AppRoute.self){ route in
                switch route {
                case .detail(documentNumber: let document):
                    DetailRoot(
                        viewModel: container.makeDetailViewModel(
                            documentNumber: document
                        )
                    )
                case .home:
                    HomeRoot(
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
