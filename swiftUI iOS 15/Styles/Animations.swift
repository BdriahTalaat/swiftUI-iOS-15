//
//  Animations.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 17/02/1446 AH.
//

import SwiftUI

extension Animation{
    static let openCard = Animation.spring(response: 0.5,dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6,dampingFraction: 0.9)
}
