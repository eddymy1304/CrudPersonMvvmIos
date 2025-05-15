//
//  DetailScreen.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//
import SwiftUI

struct DetailRoot: View {
    
    @StateObject private var viewModel : DetailViewModel
    
    init(viewModel: DetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        DetailScreen(
            person: $viewModel.person,
            onChangedDocumentNumber: { doc in
                viewModel.onChangedDocumentNumber(documentNumber: doc)
            },
            onChangedName: { name in
                viewModel.onChangedName(name: name)
            },
            onChangedLastName: { lastname in
                viewModel.onChangedLastName(lastName: lastname)
            },
            onChangedAge: { age in
                viewModel.onChangedAge(age: age)
            },
            onClickAddPhoto: {
                
            },
            onClickFind: {
                Task {
                    await viewModel.findPerson()
                }
            }
        ) {
            Task {
                await viewModel.save()
            }
        }
        .task {
            await viewModel.getPersonByDocumentNumber()
        }
        .toolbar {
            ToolbarApp(
                title: AppScreens.detail.title
            )
        }
    }
}

struct DetailScreen: View {
    
    @Binding var person: PersonModel
    
    var onChangedDocumentNumber: (String) -> Void
    
    var onChangedName: (String) -> Void
    
    var onChangedLastName: (String) -> Void
    
    var onChangedAge: (String) -> Void
    
    var onClickAddPhoto: () -> Void
    
    var onClickFind: () -> Void
    
    var onClickSave: () -> Void
    
    var body: some View {
        VStack {
            
            //Photo
            ZStack(alignment: .topTrailing){
                Button(action: { onClickAddPhoto() }) {
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
            
            // Field document number and button search
            HStack(alignment: .center){
                FilledTextField(
                    text: $person.documentNumber,
                    placeholder: "document_number",
                    iconStart: "person",
                    iconEnd: "xmark",
                    onClickIconEnd: {
                        onChangedDocumentNumber("")
                    }
                ) { _, newValue in
                    print("document number new : \(newValue)")
                    onChangedDocumentNumber(newValue)
                }
                
                Button(action:{ onClickFind() }) {
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
            
            // Field name
            FilledTextField(
                text: $person.name,
                placeholder: "name"
            ) { _, newValue in
                onChangedName(newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            // Field lastname
            FilledTextField(
                text: $person.lastName,
                placeholder: "last_name"
            ) { _, newValue in
                onChangedLastName(newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            
            @State var age = if(person.age == nil){
                ""
            } else {
                String(person.age!)
            }
            // Field age
            FilledTextField(
                text: $age,
                placeholder: "age"
            ) { _, newValue in
                onChangedAge(newValue)
            }.padding(.horizontal, .paddingNormal)
                .padding(.top,.paddingSmall)
            
            // Button save
            Button(action:{ onClickSave()}) {
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
    }
}

#Preview {
    
    @Previewable @State var person = PersonModel()
    DetailScreen(
        person: $person,
        onChangedDocumentNumber: { doc in
            person.documentNumber = doc
        },
        onChangedName: { name in
            
        },
        onChangedLastName: { lastname in
            
        },
        onChangedAge: { age in
            
        },
        onClickAddPhoto: {
            
        },
        onClickFind: {
            
        }
    ) {
        
    }
}
