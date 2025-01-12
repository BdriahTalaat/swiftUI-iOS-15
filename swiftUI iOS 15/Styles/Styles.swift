//
//  Styles.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 01/02/1446 AH.
//

import SwiftUI

struct TitleModifier: ViewModifier{
    func body(content:Content) -> some View{
        content
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}

struct StrokeModifier: ViewModifier {
    
    var cornerRadius:CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,style: .continuous)
            .stroke(
                    .linearGradient(
                        colors: [.white.opacity(colorScheme == .dark ? 0.1: 0.3),
                                 .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                        startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View{
    func strokeStyle(cornerRadius:CGFloat = 30) -> some View{
        modifier(StrokeModifier(cornerRadius: cornerRadius))
    }
}
