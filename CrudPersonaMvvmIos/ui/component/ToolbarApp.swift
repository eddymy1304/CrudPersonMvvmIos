//
//  ToolbarApp.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//

import SwiftUI

struct ToolbarApp : ToolbarContent {
    
    var title: String = ""
    var subTitle: String = NSLocalizedString("title_app", comment: "")
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.appHeadline)
                    Text(subTitle)
                        .font(.appCaption)
                        .frame(alignment: .leading)
                }
                .padding(.horizontal, .paddingNormal)
                
                Spacer()
            }
        }
    }
}


#Preview("ToolbarAppPreview") {
    NavigationStack {
        // 2. Un contenido placeholder (puede ser vacío o un texto simple)
        Color.clear // O Text("Contenido Falso")
        //.navigationTitle("Preview") // Un título ayuda a ver la barra
            .toolbar {
                // 3. Aquí instancias tu ToolbarContent
                ToolbarApp(
                    title: "Preview",
                    subTitle: "Preview"
                )
            }
        // Opcional: Forzar un modo de display si es relevante
        // .navigationBarTitleDisplayMode(.inline)
    }
}
