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
    @State var buttonVisible: Bool = false
    @EnvironmentObject var locationVM: LocationVM
    @State var deleteListAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.title2)
                
                Spacer()
                
                // Easter egg - delete List Button
                Button {
                    deleteListAlert = true
//                    locationVM.clearSavedLocations()
//                    locationVM.clearSavedSelectedLocations()
                } label: {
                    Image(systemName: "trash.fill")
                }
                .foregroundColor(.white)
            }
            .alert("Do you want to delete all locations?", isPresented: $deleteListAlert) {
                Button("Delete", role: .destructive) {
                    locationVM.clearSavedLocations()
                    locationVM.clearSavedSelectedLocations()
                }
                Button("Cancel", role: .cancel){}
            }

            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                
                
                TextField(placeholder, text: $text)
                    .submitLabel(.done)
                    .background(.clear)
                    .onChange(of: text) { oldValue, newValue in
                        if newValue.count > 0 {
                            buttonVisible = true
                        } else {
                            buttonVisible = false
                        }
//                        if newValue == "CL" {
//                            locationVM.clearSavedLocations()
//                            locationVM.clearSavedSelectedLocations()
//                        }
                    }
                    .onSubmit {
                        UIApplication.shared.inputView?.endEditing(true)
                        locationVM.update(text: text)
                    }
                
                if buttonVisible {
                    Button {
                        text = ""
                        buttonVisible = true
                        locationVM.loadSavedLocations()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 15)
                            .foregroundColor(.black.opacity(0.2))
                    }
                }
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
        .environmentObject(LocationVM(weatherVM: WeatherVM()))
}
