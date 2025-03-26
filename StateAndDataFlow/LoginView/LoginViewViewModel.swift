//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    var characterCount: String {
        user.name.count.formatted()
    }
    
    private let storageManager = StorageManager.shared
    
    init(user: User = User()) {
        self.user = user
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.save(user: user)
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.clear()
    }
}

