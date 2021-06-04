//
//  ButtonForTrafficLight.swift
//  Traffic light
//
//  Created by Marat Shagiakhmetov on 04.06.2021.
//

import SwiftUI

struct ButtonForTrafficLight: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 50)
        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 5)
        )
        .shadow(radius: 20)
    }
}

struct ButtonForTrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForTrafficLight(title: "Start", action: {})
    }
}
