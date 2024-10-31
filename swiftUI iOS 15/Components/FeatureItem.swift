//
//  FeatureItem.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 07/02/1446 AH.
//

import SwiftUI

struct FeatureItem: View {
    
    var course:Course = featuredCourses[0]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            Spacer()
            Image(course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text(course.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text(course.text)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .foregroundColor(.secondary)
                //.offset(y:50)
        }
        .padding(.all, 20.0)
        .padding(.vertical,20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        //.cornerRadius(30.0)
        //.mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
        
        .strokeStyle()
        .padding(.horizontal,20)
        
        
    }
}

#Preview {
    FeatureItem()
}
