//
//  CrudPersonaMvvmIosApp.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 19/03/25.
//

import SwiftUI
import SwiftData

@main
struct CrudPersonaMvvmIosApp: App {
    
    @StateObject var dependencyContainer: DependencyContainer = DependencyContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dependencyContainer)
        }
    }
}
