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

    private let firstColor = Color(red: 175 / 255, green: 122 / 255, blue: 63 / 255)
    private let secondColor = Color(red: 108 / 255, green: 128 / 255, blue: 76 / 255)
    private let thirdColor = Color(red: 171 / 255, green: 184 / 255, blue: 104 / 255)

    var body: some View {
        Circle()
            .fill(firstColor)
            .frame(width: 30, height: 30)
            .overlay(
            ZStack {
                Circle()
                    .stroke(firstColor, lineWidth: 100)
                    .scaleEffect(shouldAnimate ? 1 : 0)
                Circle()
                    .stroke(secondColor, lineWidth: 100)
                    .scaleEffect(shouldAnimate ? 1.5 : 0)
                Circle()
                    .stroke(thirdColor, lineWidth: 100)
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
