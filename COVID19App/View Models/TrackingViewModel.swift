//
//  TrackingViewModel.swift
//  COVID19App
//
//  Created by Mohammad Azam on 4/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class TrackingListViewModel: ObservableObject {

    @Published var trackings = [TrackingViewModel]()

    func getTrackingData() {
        Webservice().getCovidTrackingResult { trackingList in
            if let trackingList = trackingList {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.trackings = trackingList.map(TrackingViewModel.init)
                }
            }
        }
    }
}

struct TrackingViewModel {

    private(set) var tracking: Tracking

    init(tracking: Tracking) {
        self.tracking = tracking
    }

    let id: UUID = UUID()

    var state: String {
        return self.tracking.state
    }

    var total: Int {
        return self.tracking.total
    }

    var positive: Int {
        return self.tracking.positive
    }

    var death: Int {
        return self.tracking.death
    }

    var hospitalized: Int {
        return self.tracking.hospitalized ?? 0
    }
}
