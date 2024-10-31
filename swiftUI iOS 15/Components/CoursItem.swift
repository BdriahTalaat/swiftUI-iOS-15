//
//  CoursItem.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 14/02/1446 AH.
//

import SwiftUI

struct CoursItem: View {
    
    var course : Course = courses[0]
    var nameSpace : Namespace.ID
    @Binding var show:Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading,spacing: 12){
                Text(course.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(course.id)", in: nameSpace)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                Text(course.subtitle)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(course.id)", in: nameSpace)
                
                Text(course.text)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "text\(course.id)", in: nameSpace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask({
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    })
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(course.id)", in: nameSpace)
            )
        }
        .foregroundStyle(.white)
        .background(
            
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(course.id)", in: nameSpace)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(course.id)", in: nameSpace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(course.id)", in: nameSpace)
        }
        .frame(height: 300)
        
    }
}


struct CourseItem_previews: PreviewProvider{
    
    @Namespace static var namespace

    static var previews: some View{
        CoursItem(nameSpace: namespace, show: .constant(true))
    }
}

