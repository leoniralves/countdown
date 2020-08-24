//
//  WidthKey.swift
//  Countdown (iOS)
//
//  Created by Leonir Alves Deolindo on 24/08/20.
//

import Foundation
import SwiftUI

struct WidthKey: PreferenceKey {
    static let defaultValue: CGSize? = nil
    static func reduce(value: inout CGSize?,
                       nextValue: () -> CGSize?) {
        value = value ?? nextValue()
    }
}
