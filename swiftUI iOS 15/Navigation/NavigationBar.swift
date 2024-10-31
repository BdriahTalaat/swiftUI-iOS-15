//
//  NavigationBar.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 07/02/1446 AH.
//

import SwiftUI

struct NavigationBar: View {
   
    var title:String = ""
    @Binding var hasScrolled:Bool //@Binding variable dont have defult value
    @State var showSearch = false
    @State var showAccountView = false
    @AppStorage("showModel") var showModel = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1:0)
            
            Text(title)
                //.font(.system(size: hasScrolled ? 22 : 32))
                .animatableFont(size: hasScrolled ? 22 : 34 ,weight: .bold )
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,20)
                .padding(.top,20)
                .offset(y: hasScrolled ? -4 : 0)
            
            HStack (spacing: 16){
                
                Button{
                    showSearch = true
                }label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36,height: 36)
                        .foregroundColor(.secondary)
                        .background(.thinMaterial,in: RoundedRectangle(cornerRadius: 14,style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                }
                
                
                Button{
                    //showAccountView = true
                    withAnimation {
                        showModel = true
                    }
                }label: {
                    AvatarView()
                        
                }
                .sheet(isPresented: $showAccountView) {
                    AccountView()
                }
                
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
            .padding(.trailing,20)
            .padding(.top,20)
            .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity,alignment: .top)
        
    }
}

#Preview {
    NavigationBar(title: "Featured", hasScrolled: .constant(false))
}
