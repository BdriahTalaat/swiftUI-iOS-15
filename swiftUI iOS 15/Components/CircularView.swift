//
//  CircularView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 04/04/1446 AH.
//

import SwiftUI

struct CircularView: View {
    var value:CGFloat = 0.2
    @State var appear = false
    var body: some View {
        Circle()
            .trim(from: 0 , to: appear ? value : 0)
            .stroke(style: StrokeStyle(lineWidth: 4,lineCap: .round))
            .fill(.angularGradient(colors: [.purple,.pink,.purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(365)))
            .rotationEffect(.degrees(270))
            .onAppear{
                withAnimation(.spring().delay(0.5)){
                    appear = true
                }
            }
            .onDisappear{
                appear = false
            }
    }
}

#Preview {
    CircularView()
}
