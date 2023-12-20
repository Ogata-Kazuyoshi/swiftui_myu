//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by user on 2023/12/17.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
