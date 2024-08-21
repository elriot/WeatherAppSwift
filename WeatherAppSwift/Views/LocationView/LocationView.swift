//
//  LocationView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationView: View {
    @State var text: String = ""
    @State private var timer: Timer?
    @Binding var selectedTab: NavPath
    
    @EnvironmentObject var locationVM: LocationVM
    
    func clearText() {
        text = ""
    }
    
    var body: some View {
        VStack {
            LocationTextField(title: "Weather", placeholder: "Search for a city or airport", text: $text)
                .onChange(of: text) {
                    startTimer()
                }
            LocationListView(locations: locationVM.locations, clearText: clearText, locationVM: locationVM, selectedTab: $selectedTab)
            Spacer()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            locationVM.update(text: self.text)
            self.timer?.invalidate() 
        }
    }
    

}

#Preview {
    LocationView(selectedTab: .constant(NavPath.search))
        .environmentObject(LocationVM(weatherVM: WeatherVM()))
}
