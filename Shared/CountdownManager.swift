//
//  MyTimer.swift
//  Countdown (iOS)
//
//  Created by Leonir Alves Deolindo on 18/08/20.
//

import Foundation
import Combine

struct GoalTime {
    let hours: Int
    let minutes: Int
    let seconds: Int
}

class CountdownManager: ObservableObject {
    
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    private var cancellable: Cancellable?
    
    init() {}
    
    func setUp(with goal: GoalTime) {
        hours = goal.hours
        minutes = goal.minutes
        seconds = goal.seconds
    }
    
    func start() {
        cancellable = Timer.publish(every: 1.0,
                                    tolerance: nil,
                                    on: .main,
                                    in: .default,
                                    options: nil)
            .autoconnect()
            .sink(receiveValue: { (output) in
                guard self.hours > 0 ||
                        self.minutes > 0 ||
                        self.seconds > 0 else {
                    return
                }
                
                
                if (self.seconds == 0 && self.minutes == 0) {
                    self.hours = self.hours == 0 ? 0 : self.hours - 1
                    self.minutes = 59
                    self.seconds = 59
                } else if self.seconds == 0 {
                    self.minutes = self.minutes == 0 ? 59 : self.minutes - 1
                    self.seconds = 59
                } else {
                    self.seconds -= 1
                }
                
                if self.hours == 0 &&
                    self.minutes == 0 &&
                    self.seconds == 0 {
                    self.stop()
                }
            })
    }
    
    func pause() {
        cancellable?.cancel()
    }
    
    func resume() {
        start()
    }
    
    func stop() {
        cancellable?.cancel()
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }

    deinit {
        stop()
    }
}
