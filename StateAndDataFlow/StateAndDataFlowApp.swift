//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var loginViewVM = LoginViewViewModel(
        user: StorageManager.shared.fetchUser()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(loginViewVM)
    }
}
