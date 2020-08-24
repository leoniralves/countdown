//
//  MyTimer.swift
//  Countdown (iOS)
//
//  Created by Leonir Alves Deolindo on 18/08/20.
//

import Foundation
import Combine

class CountdownManager {

    private var cancellable: Cancellable?
    
    init() {}
    
    func start() {
        cancellable = Timer.publish(every: 1.0,
                                    tolerance: nil,
                                    on: .main,
                                    in: .default,
                                    options: nil)
            .autoconnect()
            .sink(receiveValue: { (output) in
                print(output)
            })
    }
    
    func stop() {
        cancellable?.cancel()
    }

    deinit {
        stop()
    }
}
