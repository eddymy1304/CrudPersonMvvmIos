//
//  DomainMapper.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

protocol ResponseToDomainMapper {
    
    associatedtype Response
    associatedtype Domain
    
    func asDomain(response: Response) -> Domain
    
}

protocol EntityToDomainMapper {
    
    associatedtype Entity
    associatedtype Domain
    
    func asDomain(entity: Entity) -> Domain
    
    func asEntity(domain: Domain) -> Entity
}
