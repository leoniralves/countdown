//
//  CountdownViewModel.swift
//  Countdown (iOS)
//
//  Created by Leonir Alves Deolindo on 25/08/20.
//

import Foundation
import Combine

final class CountdownViewModel: ObservableObject {
    // MARK: Public properties
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    // MARK: Private properties
    private var countdownManager: CountdownManager
    private var cancelable: AnyCancellable?
    
    // MARK: Initializer
    init(countdownManager: CountdownManager) {
        self.countdownManager = countdownManager
        setup()
    }
    
    // MARK: Private Methods
    private func setup() {
        hours = countdownManager.hours
        minutes = countdownManager.minutes
        seconds = countdownManager.seconds
        
        cancelable = countdownManager.currentTime.sink {
            self.hours = $0.hours
            self.minutes = $0.minutes
            self.seconds = $0.seconds
        }
    }
    
    // MARK: Public Methods
    func countdownStart() {
        countdownManager.start()
    }
    
    func countdownPause() {
        countdownManager.pause()
    }
    
    func countdownResume() {
        countdownManager.resume()
    }
    
    func countdownStop() {
        countdownManager.stop()
    }

    // MARK: Deinit
    deinit {
        cancelable?.cancel()
    }
}
