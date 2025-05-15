//
//  HomeViewModel.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

import Foundation

@MainActor
class HomeViewModel : ObservableObject {
    
    private let repository : PersonRepository
    
    init(repository: PersonRepository) {
        self.repository = repository
    }
    
    @Published private(set) var personList : [PersonModel] = []
    
    @Published var isLoading : Bool = false
    
    @Published var errorMessage : String? = nil
    
    func deletePerson(person: PersonModel) async {
        
        isLoading = true
        defer{isLoading = false}
        
        let response = await repository.delete(person: person)
        
        switch response {
        case .success():
            print("delete success person: \(person)")
        case .failure(let error):
            print("Error: \(error.localizedDescription.lowercased())")
        }
        
    }
    
    func getPersons() async {
        
        isLoading = true
        defer{isLoading = false}
        
        let response = await repository.getAll()
        
        switch response {
        case .success(let persons):
            personList = persons
        case .failure(let error):
            errorMessage = error.localizedDescription.lowercased()
        }
    }
    
}
