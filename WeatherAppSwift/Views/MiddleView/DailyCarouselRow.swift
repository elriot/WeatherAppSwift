//
//  DailyCarouselRow.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI
struct CarouselRow: View {
    let items: [String] // 예를 들어 이미지 이름을 리스트로 가정
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:2) {
                ForEach(items, id: \.self) { item in
                    VStack(spacing: 14) {
                        Text("9:00 AM")
//                            .font(.)
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            
                        Text("27°")
                    }
                    .frame(width: 70, height: 100)
                    .padding()
                    .border(.gray)
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(15)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 120)
    }
}
struct DailyCarouselRow: View {
    var body: some View {
        CarouselRow(items: ["star", "moon", "sun.max", "cloud", "snowflake", "tornado"])
    }
}

#Preview {
    DailyCarouselRow()
}
