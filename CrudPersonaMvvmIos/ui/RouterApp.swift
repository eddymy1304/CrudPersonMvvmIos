//
//  RouterApp.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 4/05/25.
//
import Foundation
import SwiftUI

@MainActor
class RouterApp : ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateToHome() {
        path.append(AppRoute.home)
    }
    
    func navigateToDetail(documentNumber: String) {
        path.append(AppRoute.detail(documentNumber: documentNumber))
    }
}
