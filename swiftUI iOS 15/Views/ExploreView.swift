//
//  ExploreView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct ExploreView: View {
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView{
                courseSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                topicsSection
                
                Text("Popular".uppercased())
                    .titleStyle()
                handbooksSection
            }
            
            
            .safeAreaInset(edge:.top){
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Recent", hasScrolled: .constant(true)))
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
    
    var handbooksSection: some View {
        HStack(alignment: .top, spacing: 16) {
            ForEach(handbooks) { item in
                HandBookItem(handbook: item)
            }
        }
        .padding(.horizontal,20)
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
    ExploreView()
}
