//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 25.03.2025.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color)
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Button", color: .blue, action: {})
    }
}
