//
//  CustomShape.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 11/11/24.
//

import SwiftUI

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
