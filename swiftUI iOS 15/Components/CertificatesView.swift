//
//  CertificatesView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct CertificatesView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack (alignment: .leading,spacing: 8){
                Text("SwiftUI for iOS 15")
                    .font(.title3.weight(.semibold))
                
                Text("Certificate")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
                
            }
            Spacer()
            VStack (alignment: .leading,spacing: 8){
                Text("Feb 25 , 2022".uppercased())
                    .font(.footnote.weight(.semibold))
                
                Text("DesignCode instructor: Meng To")
                    .font(.footnote.weight(.semibold))
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity ,alignment: .leading)
        .overlay(
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
        )
        .padding(20)
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

#Preview {
    CertificatesView()
}
