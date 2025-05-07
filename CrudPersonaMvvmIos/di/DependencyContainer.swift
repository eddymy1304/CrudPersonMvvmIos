//
//  DependencyContainer.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 4/05/25.
//

import Foundation

@MainActor
class DependencyContainer : ObservableObject {

    
    init() {
        print("Init DependencyContainer")
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }
    
    func makeDetailViewModel() -> DetailViewModel {
        return DetailViewModel()
    }
}
