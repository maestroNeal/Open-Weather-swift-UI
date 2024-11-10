//
//  AppEnums.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 10/11/24.
//
import SwiftUI

enum PlaceFilterType {
    case city
    case noFilter
}

enum appColors {
    case primaryColor
    case lightPrimaryColor
    case buttonColor
    case primaryTextColor
    case secondaryTextColor
    case borderColor
    
    var color : Color {
        switch self {
        case .primaryColor:
            return Color(hex: "#546465")
        case .lightPrimaryColor:
            return Color(hex: "#708080")
        case .buttonColor:
            return Color(hex: "#BFA990")
        case .primaryTextColor:
            return Color(hex: "#FFFFFF")
        case .secondaryTextColor:
            return Color(hex: "#D0D4D4")
        case .borderColor:
            return Color(hex: "#4B5859")
        }
    }
    
    var uiColor: UIColor {
        switch self {
        case .primaryColor:
            return UIColor(hex: "#546465")
        case .lightPrimaryColor:
            return UIColor(hex: "#708080")
        case .buttonColor:
            return UIColor(hex: "#708080")
        case .primaryTextColor:
            return UIColor(hex: "#FFFFFF")
        case .secondaryTextColor:
            return UIColor(hex: "#D0D4D4")
        case .borderColor:
            return UIColor(hex: "#4B5859")
        }
    }
    
}
