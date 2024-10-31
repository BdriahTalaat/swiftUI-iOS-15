//
//  Suggestion.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 23/02/1446 AH.
//

import SwiftUI

struct Suggestion:Identifiable{
    
    var id = UUID()
    var text : String
    
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
