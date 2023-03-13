//
//  ContentView.swift
//  SineCosine
//
//  Created by Alexander von Below on 09.03.23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    @State var angle: CGFloat = 3.9
    var body: some View {
        VStack {
            Slider(value: $angle, in: 0...(2*Double.pi)) {
                Text("Speed")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("2π")
            }
            .padding()
            Text("\(angle, specifier: "%.2f")")
                .padding()
            UnitCircleView(angle: angle)
                .padding()
        }
        .onReceive(timer) { input in
            angle += 0.01
            if angle > 2*Double.pi {
                angle = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
