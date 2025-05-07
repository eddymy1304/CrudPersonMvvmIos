//
//  AppScreens.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//
import SwiftUI

enum AppScreens: String, Identifiable, CaseIterable {
    
    case home
    case detail
    
    var id : String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .detail: return "Detail"
        }
    }
    
    var icon : String {
        switch self {
        case .home: return "house"
        case .detail: return "pencil"
        }
    }

}

enum AppRoute : Hashable {
    case home
    case detail(documentNumber: String)
}
