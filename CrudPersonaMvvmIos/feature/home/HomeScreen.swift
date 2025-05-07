//
//  HomeScreen.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//
import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var viewModel: HomeViewModel
    
    var onNavigateToDetail: (_ documentNumber: String) -> Void
    
    init(
        viewModel: HomeViewModel,
        onNavigateToDetail:@escaping (_ documentNumber: String) -> Void
    ) {
        _viewModel  = StateObject(wrappedValue: viewModel)
        self.onNavigateToDetail = onNavigateToDetail
    }
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("List of persons")
                    .font(.appBody)
                    .bold()
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.horizontal, .paddingNormal)
                
                List(viewModel.personList, id: \.documentNumber) { item in
                    PersonItem(
                        person: item,
                        onClickDelete: {
                            viewModel.deletePerson(person: item)
                        }
                    ) {
                        onNavigateToDetail(item.documentNumber)
                    }
                }.listStyle(.plain)
                
            }
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    FabButton(icon: "plus") {
                        onNavigateToDetail("")
                    }
                    .padding(.paddingLarge)
                }
            }
        }
        .toolbar {
            ToolbarApp(
                title: AppScreens.home.title
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("HomeScreen") {
    let viewmodel = HomeViewModel()
    HomeScreen(viewModel: viewmodel) { _ in
        
    }
}
