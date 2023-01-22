//
//  SliderUIKit.swift
//  SliderGame
//
//  Created by Илья Морин on 22.01.2023.
//


import SwiftUI
import Foundation

struct SliderUIKit: UIViewRepresentable {

  final class Coordinator: NSObject {
    
    var value: Binding<Double>

    
    init(value: Binding<Double>) {
      self.value = value
    }

    
    @objc func valueChanged(_ sender: UISlider) {
      self.value.wrappedValue = Double(sender.value)
    }
  }

  var thumbColor: UIColor = .white
  var TrackColor: UIColor?
  

  @Binding var value: Double

  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.thumbTintColor = thumbColor
    slider.tintColor = TrackColor
    slider.minimumValue = 0
    slider.maximumValue = 100
    slider.value = Float(self.value)

    slider.addTarget(
      context.coordinator,
      action: #selector(Coordinator.valueChanged(_:)),
      for: .valueChanged
    )

    return slider
  }

  func updateUIView(_ uiView: UISlider, context: Context) {
    uiView.value = Float(self.value)
  }

  func makeCoordinator() -> SliderUIKit.Coordinator {
    Coordinator(value: $value)
  }
}

#if DEBUG
struct SliderUIKit_Previews: PreviewProvider {
  static var previews: some View {
    SliderUIKit(
      thumbColor: .white,
      TrackColor: .systemBlue,
      value: .constant(0.5)
    )
  }
}
#endif
