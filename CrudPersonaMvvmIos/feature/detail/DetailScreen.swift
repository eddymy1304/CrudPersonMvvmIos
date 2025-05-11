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
            
            //Photo 
            ZStack(alignment: .topTrailing){
                Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
                }
                .padding(.all, .paddingExtraSmall)
                
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }.padding(.vertical, .paddingNormal)
            
            HStack(alignment: .center){
                FilledTextField(
                    text: $viewModel.person.documentNumber,
                    placeholder: "document_number",
                    iconStart: "person",
                    iconEnd: "xmark",
                    onClickIconEnd: {
                        viewModel.onChangedDocumentNumber(documentNumber: "")
                    }
                ) { _, newValue in
                    viewModel.onChangedDocumentNumber(documentNumber: newValue)
                }
                
                Button(action:{
                    viewModel.findPerson()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: .paddingMid)
                            .foregroundStyle(Color.primaryColor)
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                            .padding(.paddingMid)
                    }
                }
                .fixedSize()
                
            }.padding(.horizontal, .paddingNormal)
            
            FilledTextField(
                text: $viewModel.person.name,
                placeholder: "name"
            ) { _, newValue in
                viewModel.onChangedName(name: newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            FilledTextField(
                text: $viewModel.person.lastName,
                placeholder: "last_name"
            ) { _, newValue in
                viewModel.onChangedLastName(lastName: newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            @State var age = if(viewModel.person.age == nil){
                ""
            } else {
                String(viewModel.person.age!)
            }
            FilledTextField(
                text: $age,
                placeholder: "age"
            ) { _, newValue in
                viewModel.onChangedAge(age: newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            
            Button(action:{
                viewModel.save()
            }) {
                Text("Save")
                    .font(.appBody)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.paddingMid)
                    .background{
                        RoundedRectangle(cornerRadius: .paddingMid)
                            .foregroundStyle(Color.primaryColor)
                    }
            }.padding(.vertical, .paddingNormal)
            
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
