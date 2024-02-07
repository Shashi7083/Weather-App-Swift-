//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Shashi Ranjan Kumar on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack{
            // to pass a State variable
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 10){
                HStack {
                    CityTextView(cityName: "Darbhanga, Bihar")
                    Spacer()
                    Image(systemName: !isNight ? "sun.min.fill" : "moon.circle.fill")
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        
                }
                .padding(10)
                
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                    
                    
                    HStack (spacing : 25){
                        WeatherDayView(
                        dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74
                        )
                        
                        WeatherDayView(
                        dayOfWeek: "WEB", imageName: "sun.max.fill", temperature: 54
                        )
                        WeatherDayView(
                        dayOfWeek: "THR", imageName: "wind.snow", temperature: 73
                        )
                        WeatherDayView(
                        dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60
                        )
                        WeatherDayView(
                        dayOfWeek: "SAT", imageName: "snow", temperature: 25
                        )
                    }
                    Spacer()
                    
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
                }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    //to recieve a state variable
    //bindin used when you want to change the variable else we can do normally
    @Binding var isNight: Bool
    
  
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color.lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        //available in ios 16 or above
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}


struct CityTextView : View {
    
    var cityName : String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView : View {
    
    var imageName : String
    var temperature : Int
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
        }
        .padding(.bottom, 40)
    }
}


