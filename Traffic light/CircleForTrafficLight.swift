//
//  CircleForTrafficLight.swift
//  Traffic light
//
//  Created by Marat Shagiakhmetov on 02.06.2021.
//

import SwiftUI

struct CircleForTrafficLight: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 20)
    }
}

struct CircleForTrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        CircleForTrafficLight(color: .primary, opacity: 1)
    }
}
