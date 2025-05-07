//
//  PersonEntity.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//
import Foundation
import SwiftData

@Model
final class PersonEntity {

    @Attribute(.unique) var documentNumber: String
    
    var name: String
    
    var lastName: String
    
    var age: Int?
    
    var documentType: Int
    
    init(documentNumber: String,name: String, lastName: String, age: Int? = nil, documentType: Int) {
        self.documentNumber = documentNumber
        self.name = name
        self.lastName = lastName
        self.age = age
        self.documentType = documentType
    }
}
