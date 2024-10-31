//
//  SignInView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 30/02/1446 AH.
//

import SwiftUI

struct SignInView: View {
    
    enum Field:Hashable{
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focusField:Field?
    @EnvironmentObject var model:Model
    @State var appear = [false,false,false]
    
    var body: some View {
        VStack(alignment:.leading , spacing: 16) {
            Text("Sign in")
                .font(.largeTitle).bold()
                .opacity(appear[0] ? 1 : 0)
                .offset(y:appear[0] ? 0 : 20)
            
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
                .opacity(appear[1] ? 1 : 0)
                .offset(y:appear[1] ? 0 : 20)
            Group {
                
                TextField("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusField,equals: .email)
                    .shadow(color: focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10 ,x:0 ,y:3)
                
                SecureField("Password", text: $password)
                    .inputStyle(icon: "lock")
                    .textContentType(.password)
                    .focused($focusField,equals: .password)
                    .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10 ,x:0 ,y:3)
                
                Button{
                    
                } label:{
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
                
                
                Divider()
                
                HStack {
                    Text("No account yet?")
                    
                    Button{
                        model.selectedModel = .signUp
                    } label:{
                        Text("**Sign up**")
                    }
                }        
                .font(.footnote)
                .foregroundColor(.secondary)
                .accentColor(.secondary)
                
            }
            .opacity(appear[2] ? 1 : 0)
            .offset(y:appear[2] ? 0 : 20)
                        
        }
        .padding(20)
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .onAppear{
            withAnimation(.spring().delay(0.1)){
                appear[0] = true
            }
            withAnimation(.spring().delay(0.2)){
                appear[1] = true
            }
            withAnimation(.spring().delay(0.3)){
                appear[2] = true
            }
        }
    }

}

#Preview {
    SignInView()
        .environmentObject(Model())
}
