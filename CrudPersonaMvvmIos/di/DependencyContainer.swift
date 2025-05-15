//
//  DependencyContainer.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 4/05/25.
//

import Foundation

@MainActor
class DependencyContainer : ObservableObject {
    
    private final let db = AppDatabase(for: [PersonEntity.self])

    private final let repository: PersonRepository
    
    init() {
        repository = PersonRepositoryImpl(context: db.context)
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(repository: repository)
    }
    
    func makeDetailViewModel(documentNumber: String) -> DetailViewModel {
        return DetailViewModel(
            repository: repository,
            documentNumber: documentNumber
        )
    }
}
