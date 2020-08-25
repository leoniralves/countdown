//
//  CountdownApp.swift
//  Shared
//
//  Created by Leonir Alves Deolindo on 17/08/20.
//

import SwiftUI

@main
struct CountdownApp: App {
    var body: some Scene {
        WindowGroup {
            CountdownView()
                .environmentObject(CountdownViewModel(countdownManager: CountdownManager(model: CountdownModel(hours: 1,
                                                                                                               minutes: 2,
                                                                                                               seconds: 2))))
        }
    }
}
