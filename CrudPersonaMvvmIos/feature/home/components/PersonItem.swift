//
//  PersonItem.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//
import SwiftUI

struct PersonItem : View {
    
    var person: PersonModel
    
    var onClickDelete: () -> Void
    
    var onClick: () -> Void
    
    var body: some View {
        HStack(
            alignment: .center,
        ){
            VStack(alignment: .leading) {
                Text(person.name)
                    .font(.appBody)
                Text(person.lastName)
                    .font(.appBody)
                Text(person.documentNumber)
                    .font(.appCaption)
                    .foregroundStyle(Color.primaryColor)
            }
            .padding(.horizontal,.paddingNormal)
            
            Spacer()
            
            
            Button(action: {
                onClickDelete()
            }){
                Image(systemName: "trash")
                    .foregroundColor(Color.primaryColor)
            }
            .padding(.all, .paddingNormal)
            .contentShape(Rectangle())
            .onTapGesture {}
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    PersonItem(
        person: PersonModel(
            documentNumber: "72554124",
            name: "Eddy David",
            lastName: "Mendoza Yamunaque",
            documentType: DocumentType.DNI
        ),
        onClickDelete: {
            
        }
    ) {
    }
}
