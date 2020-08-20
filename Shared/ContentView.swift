//
//  ContentView.swift
//  Shared
//
//  Created by Leonir Alves Deolindo on 17/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myTime: CountdownManager = CountdownManager()
    
    var body: some View {
        return VStack {
            HStack(spacing: 24) {
                Button("Start") {
                    self.myTime.setUp(with: GoalTime(hours: 0,
                                                     minutes: 1,
                                                     seconds: 3))
                    self.myTime.start()
                }
                Button("Pause") {
                    self.myTime.pause()
                }
                Button("Resume") {
                    self.myTime.resume()
                }
                Button("Stop") {
                    self.myTime.stop()
                }
            }
            HStack(spacing: 20) {
                Text("Horas: \(myTime.hours)")
                Text("Minutes: \(myTime.minutes)")
                Text("Seconds: \(myTime.seconds)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
