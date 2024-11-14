//
//  HomeView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack(){
            appColors.primaryColor.color
                .edgesIgnoringSafeArea(.all)
            
            CustomShapeWithDottedLine(archHeight: 30, notchRadius: 10, fromTop: 280,fromLeft: 10,fromRight: 10,lineColor: appColors.primaryColor.color, fillColor: appColors.primaryTextColor.color)
            
            VStack{
                
                NewHeaderView(headerText: "Home", isBackRequired: false, isSearchTapped: {
                })
                .padding(.top, 50)
                Spacer()
            }
            
            
        }
        
    }
}

#Preview {
    HomeView()
}
