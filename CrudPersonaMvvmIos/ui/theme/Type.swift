//
//  Type.swift
//  CrudPersonaMvvmIos
//
//  Created by Eddy David Mendoza on 1/05/25.
//
import SwiftUICore

extension Font {
    
    static func appFontRegular(size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
        let regular = "ComicRelief-Regular"
        return .custom(regular, size: size, relativeTo: style)
    }
    
    static func appFontBold(size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
        let bold = "ComicRelief-Bold"
        return .custom(bold, size: size, relativeTo: style)
    }
    
    static let appTitle = Font.appFontBold(size: 24, relativeTo: .largeTitle)
    static let appHeadline = Font.appFontBold(size: 20, relativeTo: .headline)
    static let appBody = Font.appFontRegular(size: 16, relativeTo: .body)
    static let appCaption = Font.appFontRegular(size: 12, relativeTo: .caption)
}
