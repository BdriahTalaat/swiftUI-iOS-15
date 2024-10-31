//
//  AngularButton.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 25/02/1446 AH.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
   
    @Environment(\.controlSize) var controlSize
    
    var extraPadding : CGFloat{
        switch controlSize{
        case .mini:
            return 0
            
        case .small:
            return 0
            
        case .regular:
            return 4
            
        case .large:
            return 10
        
        @unknown default:
            return 0
        }
    }
    
    var cornerRadius : CGFloat{
        switch controlSize{
        case .mini:
            return 12
            
        case .small:
            return 12
            
        case .regular:
            return 16
            
        case .large:
            return 20
        
        @unknown default:
            return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,10 + extraPadding)
            .padding(.vertical,4 + extraPadding)
        
            .background(
                
                RoundedRectangle(cornerRadius: cornerRadius, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.linearGradient(colors: [Color(.systemBackground)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .background(
                
                RoundedRectangle(cornerRadius: cornerRadius, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.angularGradient(colors: [.pink,.purple,.blue,.pink], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: cornerRadius)
            )
            .strokeStyle(cornerRadius: cornerRadius)
    }
}

extension ButtonStyle where Self == AngularButtonStyle{
    static var angular: Self {
        return .init()
    }
}
