//
//  SectionView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct SectionView: View {
    
    var section:CourseSection = courseSections[0]
    @EnvironmentObject var model : Model
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y:120)
                    .padding(.bottom,200)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
        }
        
    }
    
    var cover: some View{
       
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height:500)
        .foregroundStyle(.black)
        .background(
            
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 500)
        )
        .background(
            Image(section.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
        )
        .mask {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
        }
        .overlay{
            overlayContent
        }
        .frame(height: 500)
        
    }
    
    var overlayContent: some View{
        VStack (alignment: .leading,spacing: 12){
            
            Text(section.title)
                .font(.largeTitle.weight(.bold))
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Text(section.subtitle)
                .font(.footnote.weight(.semibold))
            
            Text(section.text)
                .font(.footnote.weight(.semibold))
            
            Divider() // الخط الي يقسم بين كل قسم the line that divide between each section
                
            HStack{
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26,height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.thinMaterial,in: RoundedRectangle(cornerRadius: 18,style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                
                Text("Taught by Meng To")
                    .font(.footnote)
            }
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask({
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                })
        )
        .offset(y:250)
        .padding(20)
    }
    
    var content: some View{
        VStack(alignment: .leading , spacing: 30){
            
            Text("SwiftUI is hands-down the best way for designers to take a first step into code.")
                .font(.title3).fontWeight(.medium)
            
            Text("This course")
                .font(.title).bold()
            
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the I process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple")
            
            Text("Multiplatform app")
                .font(.title).bold()
            
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density.")

        }
        .padding(20)
    }
    
    var button: some View{
        Button{
            dismiss()
        }label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial,in: Circle())
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }

}


#Preview {
    SectionView(/*nameSpace: Namespace.ID, show: */)
}
