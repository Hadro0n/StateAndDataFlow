//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        Group {
            if loginViewVM.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(LoginViewViewModel())
    }
}
