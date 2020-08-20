//
//  NumberView.swift
//  Countdown
//
//  Created by Leonir Alves Deolindo on 20/08/20.
//

import SwiftUI

enum TimeType: String {
    case hours = "H"
    case minutes = "M"
    case seconds = "S"
}

struct NumberView: View {
    @Binding var number: Int
    @Binding var type: TimeType
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center, spacing: 0) {
                Text("\(number)")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                Rectangle()
                    .frame(height: 1, alignment: .top)
                    .foregroundColor(.white)
            }
            Text(type.rawValue)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(number: .constant(12), type: .constant(.hours))
            .background(Color.black)
    }
}
