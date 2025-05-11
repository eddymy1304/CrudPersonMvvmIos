//
//  PersonRepositoryImpl.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 11/05/25.
//

import SwiftData
import Foundation

class PersonRepositoryImpl : PersonRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func save(person: PersonModel) async -> Result<Void, Error> {
        do {
            let entity = person.asEntity()
            context.insert(entity)
            try context.save()
            return .success(())
        } catch {
            return .failure(error)
        }
    }
    
    func getAll() async -> Result<[PersonModel], Error> {
        do {
            let fetch = FetchDescriptor<PersonEntity>()
            let result = try context.fetch(fetch)
            if (!result.isEmpty) {
                let mapped = result.map { entity in
                    entity.asDomain()
                }
                
                return .success(mapped)
            }
            return .success([])
        } catch {
            return .failure(error)
        }
    }
    
    func findPersonByDocumentNumber(documentNumber: String) async -> Result<PersonModel, Error> {
        return .success(PersonModel())
    }
    
    func getPersonByDocumentNumber(documentNumber: String) async -> Result<PersonModel, Error> {
        do {
            let predicate = #Predicate<PersonEntity> { entity in
                entity.documentNumber == documentNumber
            }
            let fetch = FetchDescriptor<PersonEntity>(predicate: predicate)
            let result = try context.fetch(fetch)
            if let person = result.first {
                return .success(person.asDomain())
            }
            return .failure(NotFound())
        } catch {
            return .failure(error)
        }
    }
    
    func delete(person: PersonModel) async -> Result<Void, Error> {
        do {
            let entity = person.asEntity()
            context.delete(entity)
            try context.save()
            return .success(())
        } catch {
            return .failure(error)
        }
    }
    
    
    
    
}
