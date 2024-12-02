//
//  CityView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 13/10/24.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityVM : CityViewModel
    var body: some View {
        //ScrollView(.vertical,showsIndicators: false) {
            VStack{
                CityDateView(city: cityVM.city, date: cityVM.date)
                TodayWeatherView(cityVM: cityVM)
                HourlyWeatherView(cityVM: cityVM)
                DailyWeatherView(cityVM: cityVM)
            }
       // }
        
    }
}

#Preview {
    CityView(cityVM: CityViewModel())
}
