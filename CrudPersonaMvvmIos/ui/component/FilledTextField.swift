//
//  CustomTextField.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 6/05/25.
//

import SwiftUI

struct FilledTextField : View {
    
    @Binding var text: String
    
    var placeholder: String = ""
    
    var enabled: Bool = true
    
    var iconStart: String? = nil
    
    var iconEnd: String? = nil
    
    var onClickIconStart: (() -> Void)? = nil
    
    var onClickIconEnd: (() -> Void)? = nil
    
    @FocusState private var isFocused: Bool
    
    var onChange: (_ oldValue:String, _ newValue:String) -> Void
    
    var body: some View {
        
        let paddingLeading: CGFloat = iconStart == nil ?
            .paddingNormal : .paddingXxxLarge
        
        let paddingTrailing: CGFloat = iconEnd == nil ?
            .paddingNormal : .paddingXxxLarge
        
        let placeholderFormat = String(
            NSLocalizedString(placeholder, comment: "")
        )
        
        TextField(
            placeholderFormat,
            text: $text
        )
        .padding(.leading, paddingLeading)
        .padding(.trailing, paddingTrailing)
        .padding(.vertical, .paddingNormal)
        .disabled(!enabled)
        .focused($isFocused)
        .tint(.primaryColor)
        .onChange(of: text) { old, new in
            onChange(old, new)
        }
        .background {
            ZStack{
                UnevenRoundedRectangle(
                    topLeadingRadius: .paddingSmall,
                    topTrailingRadius: .paddingSmall
                )
                .foregroundStyle(Color.surfaceColor)
                VStack {
                    Spacer()
                    
                    let heightDivider: CGFloat = isFocused ? 2.0 : 1.0
                    let colorDivider: Color = isFocused ? Color.primaryColor : Color.gray
                    Divider()
                        .frame(height: heightDivider)
                        .background(colorDivider)
                }
            }
        }
        .overlay {
            HStack(alignment: .center) {
                if let icon = iconStart {
                    if(onClickIconStart == nil) {
                        Image(systemName: icon)
                            .foregroundStyle(Color.textSecundaryColor)
                            .padding(.all, .paddingMid)
                    } else {
                        Button(action:{onClickIconStart!()}) {
                            Image(systemName: icon)
                                .foregroundStyle(Color.textSecundaryColor)
                                .padding(.all, .paddingMid)
                        }
                    }
                }
                Spacer()
                if let icon = iconEnd {
                    if(onClickIconEnd == nil){
                        Image(systemName: icon)
                            .foregroundStyle(Color.textSecundaryColor)
                            .padding(.all, .paddingMid)
                    } else {
                        Button(action:{onClickIconEnd!()}) {
                            Image(systemName: icon)
                                .foregroundStyle(Color.textSecundaryColor)
                                .padding(.all, .paddingMid)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    
    @Previewable @State var text: String = ""
    
    FilledTextField(
        text: $text,
        placeholder: "PlaceHolder...",
        iconStart: "person",
        iconEnd: "xmark",
    ) { _,_ in
        
    }
}
