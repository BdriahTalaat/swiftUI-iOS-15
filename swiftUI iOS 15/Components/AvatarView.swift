//
//  AvatarView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 01/03/1446 AH.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        AsyncImage(url:URL( string: "https://picsum.photos/200"),transaction: Transaction(animation: .easeOut)){ place in
            
            switch place {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .transition(.scale(scale:0.5,anchor: .center))
            case .failure(let error):
                Color.gray
            @unknown default:
                EmptyView()
                    
            }
       
        }
        .frame(width: 26,height: 26)
        .cornerRadius(10)
        .padding(8)
        .background(.thinMaterial,in: RoundedRectangle(cornerRadius: 18,style: .continuous))
       .strokeStyle(cornerRadius: 18)

    }
}

#Preview {
    AvatarView()
}
