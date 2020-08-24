//
//  ContentView.swift
//  Shared
//
//  Created by Leonir Alves Deolindo on 17/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myTime: CountdownManager = CountdownManager()
    
    @State private var rectangleSize: CGSize? = nil
    
    init() {
        self.myTime.setUp(with: GoalTime(hours: 1,
                                         minutes: 0,
                                         seconds: 3))
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            GeometryReader(content: { geometry in
                ZStack(alignment: Alignment(horizontal: .leading,
                                            vertical: .center)) {
                    VStack {
                        NumberView(number: self.$myTime.hours,
                                   timeType: .constant(.hours))
                        Spacer()
                        NumberView(number: self.$myTime.minutes,
                                   timeType: .constant(.minutes))
                        Spacer()
                        NumberView(number: self.$myTime.seconds,
                                   timeType: .constant(.seconds))
                    }
                    .padding(.init(top: 0,
                                   leading: 16,
                                   bottom: 16,
                                   trailing: 0))
                    .frame(width: geometry.size.width/2)
                    
                    VStack(alignment: .trailing) {
                        VStack {
                            TitleView()
                                .background(GeometryReader(content: { geometry in
                                    Color.clear.preference(key: WidthKey.self,
                                                           value: self.rectangleSize)
                                }))
                                .onPreferenceChange(WidthKey.self, perform: { value in
                                    self.rectangleSize = value
                                })
                        }
                        .rotationEffect(.degrees(90))
                        .frame(width: rectangleSize?.height,
                               height: rectangleSize?.width)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing,
                               spacing: 5) {
                            Button("START") {
                                myTime.start()
                            }
                            .frame(height: 44)
                            
                            Button("PAUSE") {
                                myTime.pause()
                            }
                            .frame(height: 44)
                            
                            Button("RESUME") {
                                myTime.resume()
                            }
                            .frame(height: 44)
                            
                            Button("STOP") {
                                myTime.stop()
                            }
                            .frame(height: 44)
                        }
                        .font(.custom("RobotoCondensed-Regular", size: 22))
                        .foregroundColor(.white)
                        
                    }
                    .padding(.init(top: 16,
                                   leading: 0,
                                   bottom: 16,
                                   trailing: 16))
                    .frame(width: geometry.size.width,
                           alignment: .trailing)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
