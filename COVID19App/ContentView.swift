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
    
    init() {
        self.trackingListVM.getTrackingData()
    }
    
    
    var body: some View {
        NavigationView {
            
            List(self.trackingListVM.trackings, id: \.id) { tracking in
                HStack {
                    Text(tracking.state)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .font(.custom("", size: 22))
                    Spacer()
                    // other code to display the remaining UI
                    
                    VStack(alignment: .center) {
                        
                        Text("\(tracking.total)")
                            .foregroundColor(Color.gray)
                            .font(.custom("", size: 45))
                        
                        HStack(alignment: .center, spacing: 10) {
                            HStack {
                                Text("☠️")
                                Text("\(tracking.death)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            HStack {
                                Text("🏥")
                                Text("\(tracking.hospitalized)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                }
            }
                
            .navigationBarTitle("Covid19 Tracking")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
