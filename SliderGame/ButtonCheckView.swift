//
//  ButtonView.swift
//  SliderGame
//
//  Created by Илья Морин on 22.01.2023.
//

import SwiftUI

struct ButtonCheckView: View {
    @State private var showingAlert = false
    var score: Int
    var body: some View {
        Button("Проверь меня!") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Your Score"), message: Text("\(score)"), dismissButton: .default(Text("OK")))
        }
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCheckView(score: 0)
    }
}
