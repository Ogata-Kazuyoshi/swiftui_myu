//
//  WeatherBTN.swift
//  SwiftUI-Weather
//
//  Created by user on 2023/12/16.
//

import SwiftUI

struct WeatherBTN: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
//        VStack{
//            Text(title)
//                .bold()
//                .frame(width: 280, height: 50)
//                .background(backgroundColor.gradient)
//                .cornerRadius(10)
//            Text(title)
//                .frame(width: 280, height: 50)
//                .background(backgroundColor.gradient)
//                .font(.system(size: 20, weight: .bold, design: .default))
//                .cornerRadius(10)
//        }.foregroundColor(textColor)
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
#Preview {
    WeatherBTN(title: "title", textColor: .white, backgroundColor: .blue)
}
