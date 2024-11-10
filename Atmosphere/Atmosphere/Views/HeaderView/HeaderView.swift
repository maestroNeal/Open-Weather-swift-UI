//
//  HeaderView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 12/10/24.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var cityVM : CityViewModel
    @State private var searchedText = "Pergue"
    
    var body: some View {
        HStack{
            TextField("", text: $searchedText)
                .padding(.leading, 25)
            Button(action: {
                // placesVM.searchItem = searchedText
                cityVM.city = searchedText
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan)
                    Image(systemName: "location.fill")
                }
            })
            .frame(width: 40, height: 40)
        }
        .foregroundColor(.white)
        .padding()
        .background( ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue.opacity(0.5))
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading,10)
        })
    }
}

struct NewHeaderView:View {
    var headerText: String = ""
    var isBackRequired: Bool = false
    var isBacktapped: (() -> Void)?
    var isSearchTapped: (() -> Void)
    
    
    var body: some View {
        ZStack {
            appColors.primaryColor.color
                .edgesIgnoringSafeArea(.top)
            
            HStack(){
                if isBackRequired {
                    Button(action: {
                        isBacktapped?()
                    }) {
                        Image(systemName: "chevron.backward.2")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(appColors.buttonColor.color)
                            .padding(.leading, 15)
                        
                    }
                }
                Spacer()
                Text(headerText)
                    .font(.title)
                    .foregroundColor(appColors.secondaryTextColor.color)
                    .padding(.horizontal)
                    .padding(.vertical)
                Spacer()
                ZStack {
                    RectanleBottomLeftArch(archHeight: 20)
                        .fill(appColors.lightPrimaryColor.color)
                        .frame(width: 70,height: 120)
                        .padding(.bottom)
                        .padding(.leading)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundColor(appColors.buttonColor.color)
                        .padding(.trailing, 55)
                        .onTapGesture {
                            isSearchTapped()
                        }
                    
                }
            }
            .frame(width: .infinity)
            .padding(.bottom, 10)
        }
        
    }
}




#Preview {
    //HeaderView(cityVM: CityViewModel())
    NewHeaderView(headerText: "Text",isBackRequired: true, isBacktapped: {},isSearchTapped: {})
        .frame(width: .infinity, height: 140)
}




//struct HalfRectangle: Shape {
//    var cornerRadius: CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        // Starting point (top-left corner with rounding)
//        path.move(to: CGPoint(x: 0, y: cornerRadius))
//        
//        // Top-left rounded corner
//        path.addArc(
//            center: CGPoint(x: cornerRadius, y: cornerRadius),
//            radius: cornerRadius,
//            startAngle: .degrees(180),
//            endAngle: .degrees(270),
//            clockwise: false
//        )
//        
//        // Top straight edge
//        path.addLine(to: CGPoint(x: rect.width / 2 - cornerRadius, y: 0))
//        
//        // Top-right rounded corner
//        path.addArc(
//            center: CGPoint(x: rect.width / 2 - cornerRadius, y: cornerRadius),
//            radius: cornerRadius,
//            startAngle: .degrees(270),
//            endAngle: .degrees(0),
//            clockwise: false
//        )
//        
//        // Right vertical edge
//        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height - cornerRadius))
//        
//        // Bottom-right rounded corner
//        path.addArc(
//            center: CGPoint(x: rect.width / 2 - cornerRadius, y: rect.height - cornerRadius),
//            radius: cornerRadius,
//            startAngle: .degrees(0),
//            endAngle: .degrees(90),
//            clockwise: false
//        )
//        
//        // Bottom straight edge
//        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
//        
//        // Bottom-left rounded corner
//        path.addArc(
//            center: CGPoint(x: cornerRadius, y: rect.height - cornerRadius),
//            radius: cornerRadius,
//            startAngle: .degrees(90),
//            endAngle: .degrees(180),
//            clockwise: false
//        )
//        
//        // Close the path
//        path.closeSubpath()
//        
//        return path
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Half Rectangle with Rounded Corners")
//                .font(.headline)
//            
//            HalfRectangle(cornerRadius: 20)
//                .fill(Color.blue)
//                .frame(width: 200, height: 100)
//        }
//        .padding()
//    }
//}
//
