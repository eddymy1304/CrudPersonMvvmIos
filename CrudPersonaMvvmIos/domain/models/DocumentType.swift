//
//  TypeDocument.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

enum DocumentType: String, CaseIterable {
    case DNI
    case RUC
    case UNDEFINED
    
    var text: String {
        switch self {
        case .DNI: return "DNI"
        case .RUC: return "RUC"
        case .UNDEFINED: return ""
        }
    }
    
    var value: Int {
        switch self {
        case .DNI: return 0
        case .RUC: return 1
        case .UNDEFINED: return -1
        }
    }
}
