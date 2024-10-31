//
//  Course.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 08/02/1446 AH.
//

import SwiftUI

struct Course: Identifiable{
    let id = UUID()
    var title : String
    var subtitle : String
    var text : String
    var image : String
    var background : String
    var logo : String
}

var featuredCourses = [
    Course(title: "SwiftUI for is 15", subtitle: "20 sections - 3 hours", text: "Build an is app for ios 15 with custom layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    
    Course(title: "UI Design for ios 15", subtitle:"20 sections - 3 hours", text: "Design an iOS app for is 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    
    Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image:"Illustration 1", background: "Background 1", logo: "Logo 1"),
    
    Course(title: "React Hooks Advanced",subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]

var courses = [
    Course(title: "SwiftUI for is 15", subtitle: "20 sections - 3 hours", text: "Build an is app for ios 15 with custom layouts, animations and...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    
    Course(title: "UI Design for ios 15", subtitle:"20 sections - 3 hours", text: "Design an iOS app for is 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    
    Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image:"Illustration 1", background: "Background 1", logo: "Logo 1"),
    
    Course(title: "React Hooks Advanced",subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]

