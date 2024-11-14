//
//  CustomShapeWithDottedLine.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 11/11/24.
//

import SwiftUI

struct CustomShapeWithDottedLine: View {
    
    var archHeight: CGFloat
    var notchRadius: CGFloat
    var fromTop: CGFloat = 0.0
    var fromLeft: CGFloat = 0.0
    var fromRight: CGFloat = 0.0
    var lineColor: Color = appColors.primaryTextColor.color
    var fillColor: Color = appColors.borderColor.color
    private let dashPattern: [CGFloat] = [5,5]
    
    var body: some View {
        let screenHeight: CGFloat = UIScreen.main.bounds.height - fromTop
        let screenWidth: CGFloat = UIScreen.main.bounds.width - fromLeft - fromRight
        
        ZStack {
            CustomShape(archHeight: archHeight, notchRadius: notchRadius)
                .fill(fillColor)
                .frame(width: screenWidth, height: screenHeight)
                .padding(.top, fromTop)
                .padding(.leading, fromLeft)
                .padding(.trailing, fromRight)
            
            
            Path { path in
                let lineEndX = screenWidth - notchRadius * 2 + fromRight + fromLeft
                let notchPoints = screenHeight * 3/4 + fromTop
                path.move(to: CGPoint(x: notchRadius + fromLeft , y: notchPoints))
                path.addLine(to: CGPoint(x: lineEndX, y: notchPoints))
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, dash: dashPattern))
        }
        .padding()
    }
}

#Preview {
    CustomShapeWithDottedLine(archHeight: 30, notchRadius: 10, fromTop: 200,fromLeft: 10,fromRight: 10)
}
