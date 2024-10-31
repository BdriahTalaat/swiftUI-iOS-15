//
//  TabBar.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 03/02/1446 AH.
//

import SwiftUI

struct TabBar: View {
    
    @AppStorage("selectedTab") var seleactedTab : Tab = .home
    @State var color : Color = .teal
    @State var tabItemWidth : CGFloat = 0
    
    var body: some View {
        
        //MARK: TabBar
        
        GeometryReader { proxy in
            
            let hasHomeIndecator = proxy.safeAreaInsets.bottom > 20
            
            HStack {
                Buttons
            }
            .padding(.horizontal,8)
            .padding(.top,14)
            .frame(height:hasHomeIndecator ? 88 : 62, alignment: .top)
            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: hasHomeIndecator ? 34 : 0,style: .continuous))
            // circle color
            .background(
                Background
            )
            
            // rectangle color
            .overlay{
                Overlay
            }
            .strokeStyle(cornerRadius: hasHomeIndecator ? 34 : 0)
            .frame(maxHeight: .infinity,alignment: .bottom)
        .ignoresSafeArea()
        }
    }
    //---------------------views----------------------------------------------------------
    var Buttons: some View{
        ForEach(tabItems) { item in
            Button{
                withAnimation(.spring(response: 0.3,dampingFraction: 0.7)){
                    seleactedTab = item.tab
                    color = item.color
                }
            }label: {
                VStack (spacing: 0){
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 88,height: 29)
                    
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                    
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(seleactedTab == item.tab ? .primary : .secondary)
            .blendMode(seleactedTab == item.tab ? .overlay:.normal) // text color for item tab bar color
            
            // make GeometryReader video 20
            .overlay {
                GeometryReader{ proxy in
                   // tabItemWidth = proxy.size.width
                    Color.clear.preference(key: TabPrefernceKey.self, value: proxy.size.width)
                }
            }
            .onPreferenceChange(TabPrefernceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var Background: some View{
        HStack {
            
            if seleactedTab == .library{Spacer()}
            if seleactedTab == .explore{Spacer()}
            if seleactedTab == .notification{
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: tabItemWidth)
            if seleactedTab == .home{Spacer()}
            if seleactedTab == .notification{Spacer()}
            if seleactedTab == .explore{
                Spacer()
                Spacer()
            }
        }.padding(.horizontal,8)
    }
    
    var Overlay: some View{
        HStack {
            
            if seleactedTab == .library{Spacer()}
            if seleactedTab == .explore{Spacer()}
            if seleactedTab == .notification{
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28,height: 8)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity,alignment: .top)
            if seleactedTab == .home{Spacer()}
            if seleactedTab == .notification{Spacer()}
            if seleactedTab == .explore{
                Spacer()
                Spacer()
            }
        }.padding(.horizontal,8)
    }
}

#Preview {
    TabBar()
}
