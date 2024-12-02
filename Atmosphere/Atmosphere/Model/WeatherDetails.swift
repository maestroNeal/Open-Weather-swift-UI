//
//  WeatherDetails.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

class WeatherDetails: Codable {
    var main: String
    var description: String
    var icon: String
    
    init(main: String, description: String, icon: String) {
        self.main = main
        self.description = description
        self.icon = icon
    }
}
