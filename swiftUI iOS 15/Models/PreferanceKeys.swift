//
//  PreferanceKeys.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 07/02/1446 AH.
//

import SwiftUI

struct ScrollPrefranceKey:PreferenceKey{
    static var defaultValue:CGFloat  = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
