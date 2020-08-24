//
//  NumberView.swift
//  Countdown
//
//  Created by Leonir Alves Deolindo on 20/08/20.
//

import SwiftUI

struct NumberView: View {
    enum TimeType: String {
        case hours = "H"
        case minutes = "M"
        case seconds = "S"
    }
    
    @Binding var number: Int
    @Binding var timeType: TimeType
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center,
                   spacing: 0) {
                Text("\(number)")
                    .font(.custom("RobotoCondensed-Regular",
                                  size: 100))
                Rectangle()
                    .frame(height: 1,
                           alignment: .top)
            }
            Text(timeType.rawValue)
                .font(.custom("RobotoCondensed-Regular",
                              size: 18))
        }
        .foregroundColor(.white)
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
            NumberView(number: .constant(12),
                       timeType: .constant(.hours))
                .background(Color.black)
                .previewLayout(.fixed(width: 200,
                                      height: 200))
    }
}
