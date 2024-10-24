//
//  Network+Extensions.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

extension Network {
    static let baseUrlString = "https://api.openweathermap.org/data/3.0/"
    static func getUrlWithLatLong(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)"
    }
}
