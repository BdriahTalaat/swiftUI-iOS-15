//
//  ContentView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 24/01/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var seleactedTab : Tab = .home
    @EnvironmentObject var model : Model
    @AppStorage("showModel") var showModel = false
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            switch seleactedTab {
            case .home:
                HomeView()
                
            case .explore:
                ExploreView()
                  
            case .notification:
                NotificationView()
                
            case .library:
                LibraryView()
                
            }
            
            TabBar()
                .offset(y: model.shoeDetail ? 200 : 0)
            
            if showModel {
                ModelView()
                .zIndex(1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Model())
}
