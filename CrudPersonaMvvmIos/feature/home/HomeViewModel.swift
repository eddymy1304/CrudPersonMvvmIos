//
//  HomeViewModel.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

import Foundation

@MainActor
class HomeViewModel : ObservableObject {
    
    @Published var personList : [PersonModel] = [
        PersonModel(documentNumber: "72554124", name: "Eddy David", lastName: "Mendoza Yamunaque"),
        PersonModel(documentNumber: "72554125", name: "Jacqueline Marianela", lastName: "Mendoza Yamunaque"),
    ]
    
    @Published var isLoading : Bool = false
    
    @Published var errorMessage : String? = nil
    
    
    func deletePerson(person: PersonModel) {
        
    }
    
}
