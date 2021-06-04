//
//  ContentView.swift
//  Traffic light
//
//  Created by Marat Shagiakhmetov on 02.06.2021.
//

import SwiftUI

enum CurrenLight {
    case start, red, yellow, green
}

struct ContentView: View {
    @State private var currentLight = CurrenLight.start
    @State private var textButton = "Start"
    
    private func checkLight() {
        switch currentLight {
        case .start: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                CircleForTrafficLight(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                CircleForTrafficLight(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                CircleForTrafficLight(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
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
