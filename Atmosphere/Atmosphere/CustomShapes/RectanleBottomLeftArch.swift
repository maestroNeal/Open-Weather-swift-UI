//
//  RectanleBottomLeftArch.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 10/11/24.
//

import SwiftUI

struct RectanleBottomLeftArch: Shape {
    var archHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // Start at the top-left corner
            path.move(to: CGPoint(x: 0, y: 0))
            
            // Draw line down to the bottom-left arch start point
            path.addLine(to: CGPoint(x: 0, y: rect.height - archHeight))
            
            // Bottom-left arch
            path.addQuadCurve(
                to: CGPoint(x: archHeight, y: rect.height),
                control: CGPoint(x: 0, y: rect.height)
            )
            
            // Draw line across the bottom to the start of the bottom-right arch
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                        
            // Draw line up to the top-right corner
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            // Close the path
            path.closeSubpath()
            
            return path
        }
}

//#Preview {
//    RectanleBottomLeftArch()
//}
