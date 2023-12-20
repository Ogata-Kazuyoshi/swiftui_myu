//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by user on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgrondView(isNight: isNight)
            // BackgrondView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainStatusView(
                    imageName: isNight ? "moon.stars.fill":"cloud.sun.fill",
                    temperature: 76)
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                Spacer()
                Button{
                    isNight.toggle()
                    print("isNight : \(isNight)")
                    
                }label: {
                    WeatherBTN(
                        title: "Change Day Time",
                        textColor: .white,
                        backgroundColor: .mint)
                }
                Spacer()
            }
        }
//        .onAppear{
//            let button = WeatherBTN(
//                title: "Change Day Time",
//                textColor: .white,
//                backgroundColor: .mint)
//            print(type(of: button.body))
//        }
    }
}

#Preview {
    ContentView()
}
//struct ContentView_Previews: PreviewProvider{
//    static var previews: some View{
//        ContentView()
//    }
//}

struct BackgrondView: View {
    var isNight: Bool
    // @ Binding var isNight: Bool
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainStatusView:View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View{
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
//                .renderingMode(.original)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
