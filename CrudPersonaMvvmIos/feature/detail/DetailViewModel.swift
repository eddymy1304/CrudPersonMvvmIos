//
//  DetailViewModel.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

import Foundation

@MainActor
class DetailViewModel : ObservableObject {
    
    @Published var person: PersonModel = PersonModel()
    
    @Published var isLoading: Bool = false
    
    ///
    /// Validation App
    /// - Parameters:
    ///     - validate
    ///
    /// - Returns: true or false
    ///
    private func validateFields() -> Bool {
        let validate: Bool
        switch true {
        case person.name.isEmpty, person.lastName.isEmpty, person.documentNumber.isEmpty:
            validate = false
        default:
            validate = true
        }
        return validate
    }
    
    /// Function Save
    /// - Parameters:
    ///    - person: first parameter.
    ///
    /// - Note using validateFields
    ///
    ///
    func save() {
        
        if !validateFields() {return}
        
        
        
    }
    
    func findPerson() {
        
    }
    
    func onChangedDocumentNumber(documentNumber: String) {
        person.documentNumber = documentNumber
    }
    
    func onChangedName(name: String) {
        person.name = name
    }
    
    func onChangedLastName(lastName: String) {
        person.lastName = lastName
    }
    
    func onChangedAge(age: String) {
        person.age = Int(age) ?? 0
    }
    
}
