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
    
    private func checkLight() {
        let lightOn: Double = 1
        let lightOff: Double = 0.3
        
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

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                CircleForTrafficLight(color: .red, opacity: lightRed)
                CircleForTrafficLight(color: .yellow, opacity: lightYellow)
                CircleForTrafficLight(color: .green, opacity: lightGreen)
                
                Spacer()
                
                ButtonForTrafficLight(title: textButton) {
                    if textButton == "Start" {
                        textButton = "Next"
                    }
                    checkLight()
                }
            }.padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
