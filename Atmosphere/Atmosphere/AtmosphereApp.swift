//
//  AtmosphereApp.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/18/24.
//

import SwiftUI

@main
struct AtmosphereApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Configure Google Places
       // GMSPlacesClient.provideAPIKey("AIzaSyBpjp5vYYT823ht7_42uAW6r8RhTnPwC0Y")
        return true
    }
    
    private func configureTabBarAppearance(){
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 12)
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        
        let unselectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = unselectedAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
}
