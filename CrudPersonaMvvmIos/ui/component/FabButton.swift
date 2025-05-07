//
//  FabButton.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 2/05/25.
//
import SwiftUI

struct FabButton : View {
    
    
    var icon: String
    
    var description: String = ""
    
    var size: CGFloat = .frameSmall
    
    var backgroundColor: Color = Color.secundaryColor
    
    var radius: CGFloat  = .paddingSmall
    
    var iconColor: Color = Color.white
    
    var onClick: () -> Void
    
    
    var body: some View {
        Button(action: onClick) {
            Image(systemName: icon )
                .frame(width: size, height: size)
                .foregroundColor(iconColor)
                .background(
                    RoundedRectangle(cornerRadius: .paddingSmall)
                        .fill(backgroundColor)
                )
                .shadow(radius: radius)
        }
        .accessibilityLabel(description)
    }
}

#Preview {
    FabButton(
        icon: "plus"
    ) {
        
    }
}
