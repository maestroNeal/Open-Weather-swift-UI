//
//  customOutLine.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 10/11/24.
//

import SwiftUI

//struct CustomShapeWithDottedLine: View {
//    var archHeight: CGFloat = 10.0
//    var notchRadius: CGFloat = 10
//    var dashPattern: [CGFloat] = [5, 5] // Adjust for dotted appearance
//    
//    var body: some View {
//        ZStack {
//            // Main shape with rounded corners and circular notches
//            CustomShape(archHeight: archHeight, notchRadius: notchRadius)
//                .stroke(Color.red, lineWidth: 2)
//                .frame(width: 200, height: 150)
//            
//            // Dotted line connecting the notches
//            Path { path in
//                let centerY = 150 / 2 // Middle of the shape
//                path.move(to: CGPoint(x: 0, y: centerY))
//                path.addLine(to: CGPoint(x: 500, y: centerY))
//            }
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: dashPattern))
//        }
//        .padding()
//    }
//}

struct CustomShape: Shape {
    var archHeight: CGFloat
    var notchRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start at the top-left corner with a rounded corner
        path.move(to: CGPoint(x: rect.minX + archHeight, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX - archHeight, y: rect.minY))
        
        // Top-right rounded corner
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY + archHeight),
            control: CGPoint(x: rect.maxX, y: rect.minY)
        )
        
        // Right side with circular notch
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height*3/4 - notchRadius))
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.height*3/4),
            radius: notchRadius,
            startAngle: .degrees(270),
            endAngle: .degrees(90),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - archHeight))
        
        // Bottom-right rounded corner
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - archHeight, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )
        
        // Bottom edge
        path.addLine(to: CGPoint(x: rect.minX + archHeight, y: rect.maxY))
        
        // Bottom-left rounded corner
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - archHeight),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )
        
        // Left side with circular notch
        path.addLine(to: CGPoint(x: rect.minX, y: rect.height*3/4 + notchRadius))
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.height*3/4),
            radius: notchRadius,
            startAngle: .degrees(90),
            endAngle: .degrees(270),
            clockwise: true
        )
        
        // Finish the path at the top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + archHeight))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + archHeight, y: rect.minY),
            control: CGPoint(x: rect.minX, y: rect.minY)
        )
        
        return path
    }
}

struct ContentViewNew22: View {
    var body: some View {
        CustomShape(archHeight: 30, notchRadius: 10)
            .fill(appColors.buttonColor.color)
            .padding()
    }
}

#Preview {
    ContentViewNew22()
}
