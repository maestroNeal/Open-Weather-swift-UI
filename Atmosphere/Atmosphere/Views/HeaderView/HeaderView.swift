//
//  HeaderView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 12/10/24.
//

import SwiftUI

struct HeaderView: View {
    //@ObservedObject var cityVM : CityViewModel
    @ObservedObject var placesVM = PlacesModel()
    @State private var searchedText = "Pergue"
    
    var body: some View {
        HStack{
            TextField("", text: $searchedText)
                .padding(.leading, 25)
            Button(action: {
               // placesVM.searchItem = searchedText
                //cityVM.city = searchedText
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

#Preview {
    HeaderView()
}
