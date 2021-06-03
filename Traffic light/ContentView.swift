//
//  ContentView.swift
//  Traffic light
//
//  Created by Marat Shagiakhmetov on 02.06.2021.
//

import SwiftUI

enum CurrenLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var lightRed = 0.3
    @State private var lightYellow = 0.3
    @State private var lightGreen = 0.3
    @State private var currentLight = CurrenLight.red
    @State private var textButton = "Start"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                CircleForTrafficLight(color: .red, opacity: lightRed)
                CircleForTrafficLight(color: .yellow, opacity: lightYellow)
                CircleForTrafficLight(color: .green, opacity: lightGreen)
                
                Spacer()
                    .frame(height: 100)
                
                Button(action: {}) {
                    setupButton
                }
            }
        }
    }
    
    private var setupButton: some View {
        Button(action: checkLight) {
            Text(textButton)
                .font(.system(size: 30))
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .cornerRadius(20)
                .background(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 10))
                .shadow(radius: 20)
        }
    }
    
    private func checkLight() {
        let lightOn: Double = 1
        let lightOff: Double = 0.3
        
        if textButton == "Start" {
            textButton = "Next"
        }
        
            switch currentLight {
            case .red:
                lightRed = lightOn
                lightGreen = lightOff
                currentLight = .yellow
            case .yellow:
                lightYellow = lightOn
                lightRed = lightOff
                currentLight = .green
            case .green:
                lightGreen = lightOn
                lightYellow = lightOff
                currentLight = .red
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
