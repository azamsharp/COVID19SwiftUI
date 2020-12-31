//
//  ContentView.swift
//  COVID19App
//
//  Created by Mohammad Azam on 4/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var trackingListVM = TrackingListViewModel()

    /// Indicate if data are fetching
    @State private var isLoading = true

    var body: some View {
        VStack {
            if isLoading {
                VStack {
                    ZStack {
                        WavePointLoader(width: 100, height: 100, centerColor: Color(.clear), waveCenterenter: Color(red: 175 / 255, green: 122 / 255, blue: 63 / 255), waveMiddleColor: Color(red: 108 / 255, green: 128 / 255, blue: 76 / 255), waveEndingColor: Color(red: 171 / 255, green: 184 / 255, blue: 104 / 255))
                        Image("covid-19")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    Text("Fetching data...")
                }
            } else {
                NavigationView {
                    List(self.trackingListVM.trackings, id: \.id) { tracking in
                        TrackingCell(tracking: tracking)
                    }
                        .navigationBarTitle("Covid19 Tracking")
                }
            }
        } .onAppear(perform: {
            self.trackingListVM.getTrackingData()
        }) .onReceive(self.trackingListVM.$trackings, perform: { valueReceived in
            if !valueReceived.isEmpty {
                isLoading = false
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
