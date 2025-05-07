//
//  DetailScreen.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//
import SwiftUI

struct DetailScreen: View {
    
    @StateObject private var viewModel : DetailViewModel
    
    init(viewModel: DetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing){
                Button(action: {}) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.secundary)
                }
                .padding(.all, .paddingSmall)
                
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
            }
        }
        .toolbar {
            ToolbarApp(
                title: AppScreens.detail.title
            )
        }
    }
}

#Preview("DetailScreen") {
    let viewModel = DetailViewModel()
    DetailScreen(viewModel: viewModel)
}
