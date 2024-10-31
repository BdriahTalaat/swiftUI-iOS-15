//
//  ListRow.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 05/04/1446 AH.
//

import SwiftUI

struct ListRow: View {
    
    var topic:Topic = topics[0]
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName:topic.icon)
                .frame(width: 36,height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            
            Text(topic.title)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#Preview {
    ListRow()
}
