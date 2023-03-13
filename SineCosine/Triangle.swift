//
//  Triangle.swift
//  SineCosine
//
//  Created by Alexander von Below on 09.03.23.
//

import SwiftUI

struct Triangle : View {
    var angle: CGFloat
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let height = geometry.size.height
                let width = geometry.size.width
                let radius: CGFloat = min(width, height) / 2
                let origin = CGPoint(
                    x: width/2,
                    y: height/2)
                let x = cos(angle) * radius
                let sine = sin(angle)
                let y = sine * radius
                path.move(to: origin)
                path.addLine(
                    to: CGPoint(
                        x: origin.x + x,
                        y: origin.y + y))
                path.addLine(
                    to: CGPoint(
                        x: origin.x + x,
                        y: origin.y))
                path.closeSubpath()
            }
            .stroke(Color.black, lineWidth: 1)
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        let angle: CGFloat = -60.0 * CGFloat.pi / 180

        Triangle(angle: angle)
    }
}
