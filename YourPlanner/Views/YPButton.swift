//
//  YPButton.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import SwiftUI

struct YPButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        
        Button {
                // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }

        
    }
}

struct YPButton_Previews: PreviewProvider {
    static var previews: some View {
        YPButton(title: "Value", backgroundColor: .pink) {
            // Action
        }
    }
}
