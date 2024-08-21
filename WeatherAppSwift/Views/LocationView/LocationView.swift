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
    
    @ObservedObject var locationVM: LocationVM
    
    var body: some View {
        VStack {
            LocationTextField(title: "Weather", placeholder: "Search for a city or airport", text: $text)
                .onChange(of: text) {
                    startTimer()
                }
//            Divider()
//            if(lm.locations.count > 0){
                LocationListView(locations: locationVM.locations, locationVM: locationVM)
//                Divider()
//            }
            Spacer()
        }
    }
    
    func startTimer() {
//        print("start timer")
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            print("here")
            locationVM.update(text: self.text)
            self.timer?.invalidate() 
        }
    }
}

#Preview {
    LocationView(locationVM: LocationVM(weatherVM: WeatherVM()))
}
