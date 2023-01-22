//
//  ContentView.swift
//  SliderGame
//
//  Created by Илья Морин on 22.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var randomValue = Int.random(in: 0...100)
    @State private var SliderValue = Double.random(in: 0...100)
    @State var refresh: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(randomValue)")
            HStack {
                Text("0")
                SliderUIKit(thumbColor:.red, value: $SliderValue).opacity(Double(computeScore())*0.01)
                    
                Text("100")
                
            }
            
            ButtonCheckView(score: computeScore())
            
            
            Button("Начать заново") {
                update()
            }
                
        }
        .padding()
            
        
    }
    func update() {
       SliderValue = Double.random(in: 0...100)
        randomValue = Int.random(in: 0...100)
        
    }
    
    public func computeScore() -> Int {
        let difference = abs(randomValue - lround(SliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

