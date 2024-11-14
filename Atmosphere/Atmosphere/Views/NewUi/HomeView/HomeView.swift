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
            
            CustomShapeWithDottedLine( animeName: "", archHeight: 30, notchRadius: 10, fromTop: 180,fromLeft: 10,fromRight: 10,lineColor: appColors.primaryColor.color, fillColor: .white)
            
            VStack{
                
                NewHeaderView(headerText: "Noida", isBackRequired: false, isSearchTapped: {
                })
                .padding(.top, 0)
                Spacer()
            }
            
            
        }
    }
    private func currentData() -> some View {
        ZStack{
            
        }
    }
}

#Preview {
    HomeView()
}
