//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
//    @State private var timer = 3 //Свойства с оберткой State всегда должны быть приватными и инициализированными
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
