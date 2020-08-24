//
//  TitleView.swift
//  Countdown
//
//  Created by Leonir Alves Deolindo on 20/08/20.
//

import SwiftUI

struct WidthKey: PreferenceKey {
    static let defaultValue: CGSize? = nil
    static func reduce(value: inout CGSize?,
                       nextValue: () -> CGSize?) {
        value = value ?? nextValue()
    }
}

struct TitleView: View {
    @State private var countdownTextSize: CGSize? = nil
    @State private var timeTextSize: CGSize? = nil
    
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .overlay(
                VStack(alignment: .leading) {
                    Text("COUNTDOWN")
                        .font(.custom("RobotoCondensed-Regular",
                                      size: 60))
                    Text("TIMER")
                        .font(.custom("BungeeOutline-Regular",
                                      size: 50))
                }
                .background(GeometryReader { geometry in
                    Color.clear.preference(key: WidthKey.self,
                                           value: geometry.size)
                })
                .onPreferenceChange(WidthKey.self,
                                    perform: { newSize in
                                        self.countdownTextSize = newSize
                                    })
                .foregroundColor(.white)
            )
            .frame(width: countdownTextSize?.width,
                   height: countdownTextSize?.height)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
