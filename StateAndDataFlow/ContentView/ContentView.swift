//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let contentViewVM = ContentViewViewModel()
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)!")
                .padding(.top, 40)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 20)
                        
            VStack {
                Spacer()
                
                ButtonView(
                    title: contentViewVM.buttonTitle,
                    color: .red,
                    action: contentViewVM.startTimer
                )
                
                Spacer()

                ButtonView(
                    title: "Log Out",
                    color: .blue,
                    action: loginViewVM.logout
                )
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewViewModel())
    }
}
