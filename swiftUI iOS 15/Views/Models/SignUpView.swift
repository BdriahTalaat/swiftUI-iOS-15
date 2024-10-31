//
//  SignUpView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 25/02/1446 AH.
//

import SwiftUI

struct SignUpView: View {
    
    enum Field:Hashable{
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focusField:Field?
    @EnvironmentObject var model:Model
    
    var body: some View {
        VStack(alignment:.leading , spacing: 16) {
            Text("Sign up")
                .font(.largeTitle).bold()
            
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
            
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
                Text("Create Account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
           
            Group {
                Text("By clicking on ")
                + Text("_Create an account_").foregroundColor(.primary.opacity(0.7))
                + Text(", you agree to our **Terms of service** and **[Privacy policy](http://designcode.io)**.")
                    
                
                Divider()
                
                HStack {
                    Text("Already have an account?")
                    
                    Button{
                        model.selectedModel = .signIn
                    } label:{
                        Text("**Sign in**")
                    }
                }

            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
            
                        
        }
        .padding(20)
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        
    }

}

#Preview {
    ZStack {
        SignUpView()
            .environmentObject(Model())
    }
}
