//
//  PersonMapper.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

struct PersonMapper : ResponseToDomainMapper, EntityToDomainMapper {
    
    
    typealias Response = PersonResponse
    
    typealias Domain = PersonModel
    
    typealias Entity = PersonEntity
    
    
    func asDomain(response: PersonResponse) -> PersonModel {
        
        let documentType: DocumentType
        
        switch response.numeroDocumento?.count {
        case 8:
            documentType = DocumentType.DNI
        case 11:
            documentType = DocumentType.RUC
        default:
            documentType = DocumentType.UNDEFINED
        }
        
        return PersonModel(
            documentNumber: response.numeroDocumento ?? "",
            name: response.nombres ?? "",
            lastName: "\(response.apellidoPaterno ?? "") \(response.apellidoMaterno ?? "")",
            documentType: documentType,
        )
    }
    
    func asDomain(entity: PersonEntity) -> PersonModel {
        
        let documentType: DocumentType = DocumentType.allCases.first { type in
            type.value == entity.documentType
        } ?? .UNDEFINED
        
        return PersonModel(
            documentNumber: entity.documentNumber,
            name: entity.name,
            lastName: entity.lastName,
            age: entity.age,
            documentType: documentType
        )
    }
    
    func asEntity(domain: PersonModel) -> PersonEntity {
        return PersonEntity(
            documentNumber: domain.documentNumber,
            name: domain.name,
            lastName: domain.lastName,
            age: domain.age,
            documentType: domain.documentType.value
        )
    }
}

extension PersonModel {
    
    func asEntity() -> PersonEntity {
        return PersonMapper().asEntity(domain: self)
    }
    
}

extension PersonEntity {
    
    func asDomain() -> PersonModel {
        return PersonMapper().asDomain(entity: self)
    }
    
}

extension PersonResponse {
    
    func asDomain() -> PersonModel {
        return PersonMapper().asDomain(response: self)
    }
}

extension Array where Element == PersonEntity {
    
    func asDomain() -> [PersonModel] {
        //return self.map{ $0.asDomain() }
        return self.map { item in item.asDomain() }
    }
    
}
