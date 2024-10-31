//
//  Tab.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 03/02/1446 AH.
//

import SwiftUI

struct TabItem:Identifiable{
    var id = UUID()
    var text : String
    var icon : String
    var tab : Tab
    var color : Color
}

var tabItems = [
    TabItem(text: "Learn more", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .blue),
    TabItem(text: "Notification", icon: "bell", tab: .notification, color: .purple),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .pink)
]

enum Tab : String{
    case home
    case explore
    case notification
    case library
}

struct TabPrefernceKey:PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
