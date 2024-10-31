//
//  CourseView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 14/02/1446 AH.
//

import SwiftUI

struct CourseView: View {
    
    var course:Course = courses[0]
    var nameSpace : Namespace.ID
    @Binding var show:Bool
    @State var appear = [false,false,false]
    @EnvironmentObject var model : Model
    @State var showSection = false
    @State var selectedIndex = 0
    
    var body: some View {
        
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y:120)
                    .padding(.bottom,200)
                    
            }
            .coordinateSpace(name: "Scroll")
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
            
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 500)
                
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                
            
        }
        .overlay(
            overlayContent
        )
        .frame(height: 500)
    }

    var overlayContent: some View{
        VStack (alignment: .leading,spacing: 12){
            
            Text(course.title)
                .font(.largeTitle.weight(.bold))

            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Text(course.subtitle)
                .font(.footnote.weight(.semibold))
               
            Text(course.text)
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
        VStack(alignment: .leading){
            ForEach(Array(courseSections.enumerated()),id: \.offset){ index, item in
                
                if index != 0 {Divider()}
                SectionRow(section: item)
                    .onTapGesture {
                        selectedIndex = index
                        showSection = true
                    }
            }
        }
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showSection){
            SectionView(section: courseSections[selectedIndex])
        }
    }

    var button: some View{
        Button{
            withAnimation(.openCard){
                show.toggle()
                model.shoeDetail.toggle()
            }
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

struct CoursView_previews: PreviewProvider{
    
    @Namespace static var namespace

    static var previews: some View{
        CourseView(nameSpace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
