//
//  NetworkManager.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 11/05/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private var defaultHeaders: [String: String] {
        return [
            "Authorization": "Bearer \(ApiConfig.apiKey)",
            "Content-Type": "application/json"
        ]
    }
    
    private init() {}
    
    func request<T: Codable>(
        endpoint: String,
        method: HttpMethod = .get,
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: ApiConfig.baseUrl + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.getMethod()
        //request.addValue("Bearer \(ApiConfig.apiKey)", forHTTPHeaderField: "Authorization")
        
        let allHeaders = defaultHeaders.merging(headers ?? [:]) { $1 }
        allHeaders.forEach { header in request.setValue(header.value, forHTTPHeaderField: header.key) }
        
        if let body = body {
            request.httpBody = body
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  200 ..< 300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidResponse
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw NetworkError.decodingError(error)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
