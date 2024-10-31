//
//  LibraryView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView{
                
                CertificatesView()
                    .frame(height: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.purple,.blue], startPoint: .topLeading, endPoint: .topTrailing))
                            .padding(20)
                            .offset(y:-30)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.teal,.blue], startPoint: .topLeading, endPoint: .topTrailing))
                            .padding(40)
                            .offset(y:-60)
                    )
                    .padding(20)
                Text("History".uppercased())
                    .titleStyle()
                
                courseSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                topicsSection
                
                
                
                
            }
            
            
            .safeAreaInset(edge:.top){
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Library", hasScrolled: .constant(true)))
            .background(Image("Blob 1").offset(x:-100 , y:-400))
        }
    }
    
    var courseSection: some View{
        ScrollView (.horizontal,showsIndicators: false){
            HStack(spacing: 16) {
                ForEach(courses) { course in
                    SmallCourseItem(course: course)
                }
            }
            .padding(.horizontal,20)
            Spacer()
        }
    }
   
    var topicsSection: some View{
        VStack {
            ForEach(Array(topics.enumerated()),id: \.offset) { index ,item in
                if index != 0{ Divider() }
                ListRow(topic: item)
            }
            .padding(.horizontal,20)
        }
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal,20)
    }
}

#Preview {
    LibraryView()
}
