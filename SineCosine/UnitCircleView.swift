//
//  UnitCircleView.swift
//  SineCosine
//
//  Created by Alexander von Below on 12.03.23.
//

import SwiftUI

struct UnitCircleView: View {
    var angle: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let radius = min(geometry.size.height,
                                       geometry.size.width) / 2
                    path.addEllipse(in: CGRect(
                        x: geometry.size.width / 2 - radius,
                        y: geometry.size.height / 2 - radius,
                        width: radius * 2,
                        height: radius * 2))
                }
                .stroke(Color.blue, lineWidth: 2)
                Triangle(angle: angle)
            }
        }
    }
}

struct UnitCircleView_Previews: PreviewProvider {
    static var previews: some View {
        let angle: CGFloat = -40.0 * CGFloat.pi / 180

        UnitCircleView(angle: angle)
    }
}
