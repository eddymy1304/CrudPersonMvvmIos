//
//  PersonResponse.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//

struct PersonResponse : Codable {
    
    var apellidoMaterno: String? = nil
    
    var apellidoPaterno: String? = nil
    
    var digitoVerificador: String? = nil
    
    var nombres: String? = nil
    
    var numeroDocumento: String? = nil
    
    var tipoDocumento: String? = nil
}
