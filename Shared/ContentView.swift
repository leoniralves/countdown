//
//  ContentView.swift
//  Shared
//
//  Created by Leonir Alves Deolindo on 17/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myTime: CountdownManager = CountdownManager()
    
    init() {
        self.myTime.setUp(with: GoalTime(hours: 2,
                                         minutes: 1,
                                         seconds: 3))
        self.myTime.start()
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            GeometryReader(content: { geometry in
                HStack {
                    VStack(alignment: .center) {
                        NumberView(number: self.$myTime.hours,
                                   type: .constant(.hours))
                        Spacer()
                        NumberView(number: self.$myTime.minutes,
                                   type: .constant(.minutes))
                        Spacer()
                        NumberView(number: self.$myTime.seconds,
                                   type: .constant(.seconds))
                    }
                    .frame(width: geometry.size.width/2)
                    VStack(alignment: .trailing) {
                        Button("Start") {
                            myTime.start()
                        }
                        Button("Pause") {
                            myTime.pause()
                        }
                        Button("Resume") {
                            myTime.resume()
                        }
                        Button("Stop") {
                            myTime.stop()
                        }
                    }
                    .frame(width: geometry.size.width/2)
                }
                .padding(.bottom)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
