//
//  HexagonView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 02/02/1446 AH.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { content , size in
            content.draw(Text("hello").font(.largeTitle), in: CGRect(x: 50, y: 20, width: 100, height: 100))
            
            content.fill(Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)), with: .color(.pink))
            content.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            
            content.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200,height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonView()
}
