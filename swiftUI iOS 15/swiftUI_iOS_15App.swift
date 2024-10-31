//
//  swiftUI_iOS_15App.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 24/01/1446 AH.
//

import SwiftUI

@main
struct swiftUI_iOS_15App: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
