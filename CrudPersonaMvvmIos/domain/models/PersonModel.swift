//
//  PersonModel.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

import Foundation

struct PersonModel {
    
    var documentNumber: String = ""
    
    var name: String = ""
    
    var lastName: String = ""
    
    var age: Int? = nil
    
    var documentType: DocumentType = DocumentType.UNDEFINED
    
}
