//
//  PersonRepository.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 11/05/25.
//

protocol PersonRepository {
    
    func save(person: PersonModel) async -> Result<Void, Error>
    
    func getAll() async -> Result<[PersonModel], Error>
    
    func findPersonByDocumentNumber(documentNumber: String) async -> Result<PersonModel, Error>
    
    func getPersonByDocumentNumber(documentNumber: String) async -> Result<PersonModel, Error>
    
    func delete(person: PersonModel) async -> Result<Void, Error>
}
