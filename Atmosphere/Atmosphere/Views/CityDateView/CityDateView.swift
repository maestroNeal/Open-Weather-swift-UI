//
//  CityDateView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 13/10/24.
//

import SwiftUI

struct CityDateView: View {
    var city: String = "Noida"
    var date: String = "25-09-24"
    var body: some View {
        HStack{
            VStack(alignment: .center, content: {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            })
            .foregroundColor(.brown)
        }
    }
}

#Preview {
    CityDateView()
}
