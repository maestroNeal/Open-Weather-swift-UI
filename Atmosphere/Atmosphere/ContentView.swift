//
//  ContentView.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    var body: some View {
        ZStack(alignment: .bottom, content: {
            VStack(spacing: 0, content: {
                HeaderView(cityVM: cityVM)
                ScrollView(showsIndicators: false, content: {
                    CityView(cityVM: cityVM)
                })
            })
            .padding(.top, 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
