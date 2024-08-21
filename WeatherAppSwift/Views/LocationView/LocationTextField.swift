//
//  LocationTextField.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationTextField: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                
                TextField(placeholder, text: $text, axis: .vertical)
                    .submitLabel(.done)
                    .keyboardType(.emailAddress)
                    .background(.clear)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 0.3)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.background)
                    )
                
            )
        }
        .padding()
    }
}

#Preview {
    LocationTextField(title: "Weather", placeholder: "Search for a city or airport", text: .constant(""))
}
