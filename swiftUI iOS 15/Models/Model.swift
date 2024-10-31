//
//  Model.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 18/02/1446 AH.
//

import SwiftUI
import Combine

class Model:ObservableObject{
    @Published var shoeDetail : Bool = false
    @Published var selectedModel:Modal = .signIn
}

enum Modal:String{
    case signUp
    case signIn
}
