//
//  WavePointLoader.swift
//  COVID19App
//
//  Created by Thibaud Lambert on 30/12/2020.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct WavePointLoader: View {

    @State private var shouldAnimate: Bool = false

    var width: CGFloat = 30
    var height: CGFloat = 30

    var centerColor = Color(.blue)
    var waveCenterenter = Color(.blue)
    var waveMiddleColor = Color(.blue)
    var waveEndingColor = Color(.blue)

    var body: some View {
        Circle()
            .fill(centerColor)
            .frame(width: width, height: height)
            .overlay(
            ZStack {
                Circle()
                    .stroke(waveCenterenter, lineWidth: 100)
                    .scaleEffect(shouldAnimate ? 1 : 0)
                Circle()
                    .stroke(waveMiddleColor, lineWidth: 100)
                    .scaleEffect(shouldAnimate ? 1.5 : 0)
                Circle()
                    .stroke(waveEndingColor, lineWidth: 100)
                    .scaleEffect(shouldAnimate ? 2 : 0)
            }
                .opacity(shouldAnimate ? 0.0 : 0.2)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
        )
            .onAppear(perform: {
            shouldAnimate = true
        })
    }
}

struct WavePointLoader_Previews: PreviewProvider {
    static var previews: some View {
        WavePointLoader()
    }
}
