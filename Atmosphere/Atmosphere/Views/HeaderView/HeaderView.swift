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

struct NewHeaderView: View {
    var headerText: String = ""
    var isBackRequired: Bool = false
    var isBacktapped: (() -> Void)?
    var isSearchTapped: (() -> Void)
    
    var body: some View {
        ZStack {
            appColors.primaryColor.color
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                if isBackRequired {
                    Button(action: {
                        isBacktapped?()
                    }) {
                        Image(systemName: "chevron.backward.2")
                            .resizable()
                            .frame(width: 25, height: 25)
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
                    .padding(.leading, isBackRequired == false ? 90 : 55)
                
                Spacer()
                
                ZStack {
                    RectanleBottomLeftArch(archHeight: 20)
                        .fill(appColors.lightPrimaryColor.color)
                        .frame(width: 70, height: 110)
                        .padding(.bottom)
                        .padding(.leading)
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(appColors.buttonColor.color)
                        .padding(.trailing, 55)
                        .onTapGesture {
                            isSearchTapped()
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 130)
        }
        .frame(height: 130)
    }
}



#Preview {
    //HeaderView(cityVM: CityViewModel())
    NewHeaderView(headerText: "Text",isBackRequired: false, isBacktapped: {},isSearchTapped: {})
       // .frame(width: .infinity, height: 140)
}
