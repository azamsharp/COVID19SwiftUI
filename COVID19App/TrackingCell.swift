//
//  TrackingCell.swift
//  COVID19App
//
//  Created by Thibaud Lambert on 30/12/2020.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TrackingCell: View {

    var tracking: TrackingViewModel

    var body: some View {
        HStack {
            Text(tracking.state)
                .foregroundColor(Color.white)
                .font(.custom("", size: 22))
                .padding()
                .background(Color.orange)
                .clipShape(Circle())

            Spacer()

            VStack(alignment: .center) {

                Text("\(tracking.total)")
                    .foregroundColor(Color.gray)
                    .font(.custom("", size: 45))

                HStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("☠️")
                        Text("\(tracking.death)")
                    }
                        .padding(5)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    HStack {
                        Text("🏥")
                        Text("\(tracking.hospitalized)")
                    }
                        .padding(5)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }

            Spacer()
        }
    }
}

struct TrackingCell_Previews: PreviewProvider {
    static var previews: some View {
        TrackingCell(tracking:
                        TrackingViewModel(tracking: Tracking(state: "State", total: 1, positive: 0, death: 0, hospitalized: nil)))
    }
}
