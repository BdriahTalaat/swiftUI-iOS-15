//
//  NotificationView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView{
                sectionSection
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay{NavigationBar(title: "Notifications", hasScrolled: .constant(true))}
            .background(
                Image("Blob 1")
                    .offset(x:-180,y: 300)
            )
            
            
        }
       
    }
    
    var sectionSection: some View{
        VStack(alignment: .leading){
            ForEach(Array(courseSections.enumerated()),id: \.offset){ index, item in
                
                if index != 0 {Divider()}
                SectionRow(section: item)
                    .onTapGesture {
                        
                    }
            }
        }
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        
    }
}

#Preview {
    NotificationView()
}
