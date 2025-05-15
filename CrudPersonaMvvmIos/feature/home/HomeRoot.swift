//
//  HomeScreen.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//
import SwiftUI

struct HomeRoot: View {
    
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
        HomeScreen(
            personList: viewModel.personList,
            onClickDelete: { person in
                Task {
                    await viewModel.deletePerson(person: person)
                }
            }, onClickItem: { person in
                onNavigateToDetail(person.documentNumber)
            }, onClickAdd: {
                onNavigateToDetail("")
            }
        )
        .task {
            await viewModel.getPersons()
        }
        .toolbar {
            ToolbarApp(
                title: AppScreens.home.title
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomeScreen: View {
    
    var personList: [PersonModel]
    
    var onClickDelete: (PersonModel) -> Void
    
    var onClickItem: (PersonModel) -> Void
    
    var onClickAdd: () -> Void
    
    var body: some View {
        ZStack{
            VStack{
                Text("list_of_persons")
                    .font(.appBody)
                    .bold()
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.horizontal, .paddingNormal)
                
                List(personList, id: \.documentNumber) { item in
                    PersonItem(
                        person: item,
                        onClickDelete: { onClickDelete(item) }
                    ) {
                        onClickItem(item)
                    }
                }.listStyle(.plain)
                
            }
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    FabButton(icon: "plus") {
                        onClickAdd()
                    }
                    .padding(.paddingLarge)
                }
            }
        }
    }
}

#Preview("HomeScreen") {
    
    HomeScreen(personList: []) { _ in
        
    } onClickItem: { _ in
        
    } onClickAdd: {
        
    }
    
}
