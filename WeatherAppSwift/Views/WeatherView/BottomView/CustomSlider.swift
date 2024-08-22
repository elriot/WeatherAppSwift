//
//  CustomSlider.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct CustomSlider: View {
    var value: Double
    var range: ClosedRange<Double>
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    Spacer()
//                    Capsule()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(height: 4)
                    
                    Capsule()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.green, .blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: CGFloat(max(0, min(1, (self.value - self.range.lowerBound) / (self.range.upperBound - self.range.lowerBound)))) * geometry.size.width, height: 4)
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 20, height: 20)
                        .offset(x: CGFloat(max(0, min(1, (self.value - self.range.lowerBound) / (self.range.upperBound - self.range.lowerBound)))) * geometry.size.width - 10)
                    Spacer()
                }
                Spacer()
            }
//            .gesture(DragGesture(minimumDistance: 0)
//                .onChanged({ dragValue in
//                    let newValue = Double(dragValue.location.x / geometry.size.width) * (self.range.upperBound - self.range.lowerBound) + self.range.lowerBound
//                    self.value = max(self.range.lowerBound, min(self.range.upperBound, newValue))
//                })
//            )
        }
        .frame(height: 40)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomSlider(value: 20, range: 10...30)
}
