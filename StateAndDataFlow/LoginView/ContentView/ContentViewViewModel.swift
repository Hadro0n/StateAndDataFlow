//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Владислав Якунин on 19.03.2025.
//

import Foundation
import Combine //Предназначен для работы с потоками данных, нужен для работы с многозадачностью. Уходит в прошлое, хоть и новый фреймворк. на смену ему приходит Observation

final class ContentViewViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher() // Свойство, суть которого - сообщать об изменениях в объекте
    
    var counter = 3
    
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send()
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send()
    }
}
