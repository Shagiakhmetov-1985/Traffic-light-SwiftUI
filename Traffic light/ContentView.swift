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
    private let lightOff: CGFloat = 0.3
    private let lightOn: CGFloat = 1
    @State private var lightRed: CGFloat = 0.3
    @State private var lightYellow: CGFloat = 0.3
    @State private var lightGreen: CGFloat = 0.3
    @State private var currentLight = CurrenLight.red
    @State private var textButton = "Start"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                CircleForTrafficLight(color: Color(CGColor(red: 246/255, green: 14/255, blue: 34/255, alpha: lightRed)))
                CircleForTrafficLight(color: Color(CGColor(red: 238/255, green: 220/255, blue: 13/255, alpha: lightYellow)))
                CircleForTrafficLight(color: Color(CGColor(red: 52/255, green: 230/255, blue: 12/255, alpha: lightGreen)))
                
                Spacer()
                    .frame(height: 100)
                
                Button(action: {}) {
                    setupButton
                }
            }
        }
    }
    
    private var setupButton: some View {
        Button(action: {
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
            default:
                lightGreen = lightOn
                lightYellow = lightOff
                currentLight = .red
            }
        }) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
