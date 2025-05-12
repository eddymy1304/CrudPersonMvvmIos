//
//  ApiConfig.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 11/05/25.
//

import Foundation

struct ApiConfig {
    static let baseUrl: String = Bundle.main.infoDictionary?["BASE_URL_SEARCH_DNI"] as? String ?? ""
    static let timeout: TimeInterval = 30
    static let apiKey: String = Bundle.main.infoDictionary?["API_KEY_SEARCH_DNI"] as? String ?? ""
}
