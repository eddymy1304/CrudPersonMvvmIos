//
//  DetailViewModel.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

import Foundation

@MainActor
class DetailViewModel : ObservableObject {
    
    private let repository: PersonRepository
    
    private let documentNumber: String
    
    init(repository: PersonRepository, documentNumber: String) {
        self.repository = repository
        self.documentNumber = documentNumber
    }
    
    @Published var person: PersonModel = PersonModel()
    
    @Published var isLoading: Bool = false
    
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
    func save() async {
        
        if !validateFields() {return}
        
        let response = await repository.save(person: person)
        
        switch response {
        case .success():
            print("save person sucess")
        case .failure(let error):
            print("Error save person: \(error)")
        }
    }
    
    func findPerson() async {
        
        isLoading = true
        defer { isLoading = false}
        
        let response = await repository.findPersonByDocumentNumber(documentNumber: person.documentNumber)
        
        switch response {
        case .success(let data):
            let doc = person.documentNumber
            person = data
            person.documentNumber = doc
            
            
        case .failure(let error):
            print("Error find person: \(error)")
        }
    }
    
    func onChangedDocumentNumber(documentNumber: String) {
        print("viewmodel onChangedDocumentNumber \(documentNumber)")
        person.documentNumber = documentNumber
        print("viewmodel onChangedDocumentNumber end \(person.documentNumber)")
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
    
    func getPersonByDocumentNumber() async {
        
        if (documentNumber.isEmpty) { return }
        
        isLoading = true
        defer { isLoading = false }
        
        let response = await repository.getPersonByDocumentNumber(documentNumber: documentNumber)
        
        switch response {
        case .success(let data):
            person = data
        case .failure(let error):
            print("Error get person by document number: \(error)")
        }
    }
}
