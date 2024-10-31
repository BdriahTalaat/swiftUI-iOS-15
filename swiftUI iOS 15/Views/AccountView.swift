//
//  AccountView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 01/02/1446 AH.
//

import SwiftUI

struct AccountView: View {
    
    @State var isLiteMode = false
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            List{
                
                profile
                menu
                
                Section{
                    Toggle(isOn: $isLiteMode){
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }.accentColor(.primary)
                
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button{
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
        }
    }
    
    var profile: some View{
       
        VStack(spacing: 9.0)  {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle)
                .font(.system(size: 35))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue,.blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50,y: -100)
                )
                .background(
                    
                    BlobView()
                        .offset(x: 200,y: 0)
                        .scaleEffect(0.6)
                )
            Text("Mego To")
                .font(.title.weight(.semibold))
            
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                
                Text("canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding()
        
    }
    
    var menu: some View{
        Section {
            // There are two way to navigation link
            
            NavigationLink(destination: HomeView()) { // frist way
                Label("Setting",systemImage: "gear")
                    
            }
            NavigationLink{ Text("Billing") } label: {   // second way
                Label("Billing",systemImage: "creditcard")
            }
            NavigationLink{ HomeView()} label: {
                Label("Help",systemImage: "questionmark")
            }
                
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
        
    }
    
    var links: some View{
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website",systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }.swipeActions(edge: .leading,allowsFullSwipe: false){
                    
                    Button { isDeleted = true } label: {
                        Label("Delete",systemImage: "trash")
                    }.tint(.red)
                    
                    pinButton
                }
            }
        //-----------------------------------------------------------------------------
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube",systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                    
                    
                }
                
            }.swipeActions{
                pinButton
            }
            
        //------------------------------------------------------------------------------

        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        
        Button {
            isPinned.toggle()
        } label: {
            
            if isPinned{
                Label("Unpin", systemImage: "pin.slash")
            }else{
                Label("Pin", systemImage: "pin")
            }
            
        }.tint(isPinned ? .gray : .yellow)

    }
}

#Preview {
    AccountView()
}

