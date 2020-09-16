//
//  MyTimer.swift
//  Countdown (iOS)
//
//  Created by Leonir Alves Deolindo on 18/08/20.
//

import Foundation
import Combine

class CountdownManager {
    
    // MARK: Public Properties
    var currentTime = PassthroughSubject<(hours: Int, minutes:Int, seconds: Int), Never>()
    
    // MARK: Private Properties
    private(set) var hours = 0
    private(set) var minutes = 0
    private(set) var seconds = 0
    private var cancellable: Cancellable?
    
    // MARK: Initializer
    init(model: CountdownModel) {
        hours = model.hours
        minutes = model.minutes
        seconds = model.seconds
    }
    
    // MARK: Public Methodos
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
                
                self.currentTime.send((hours: self.hours,
                                       minutes: self.minutes,
                                       seconds: self.seconds))
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

    // MARK: Deinit
    deinit {
        stop()
    }
}
