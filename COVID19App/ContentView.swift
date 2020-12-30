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
                    WavePointLoader()
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
