//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jai  on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(topColor:isNight ? .black : .blue, bottomColor:isNight ? .gray:Color("lightblue"))
            VStack{
                CityTextView(
                cityName: "Cupertino,CA")
                
                MainWeatherStatusView(imageName: isNight ?"moon.fill" :"cloud.sun.fill", temperature: 74 )
                HStack(spacing:20){
                    WeatherDayView(
                        dayofWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 74)
                
                    WeatherDayView(dayofWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 55)
                    
                    WeatherDayView(dayofWeek: "THR", imageName: "sun.max.fill", temperature: 88)
                    
                    WeatherDayView(dayofWeek: "FRI", imageName: "sun.dust.fill", temperature: 78)
                    
                    WeatherDayView(dayofWeek: "SAT", imageName: "cloud.sun.fill", temperature: 74)
                }
                
                
                
                Spacer()
                
                Button {
                    isNight.toggle()
                }
                label: {
                    WeatherButton(title: "Change The Day", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                    
                
            }
         
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

struct WeatherDayView: View {
    
    var dayofWeek:String
    var imageName:String
    var temperature:Int
    
    
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var topColor:Color
    var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor] ),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
struct CityTextView:View{
    var cityName:String
    var body: some View{
    Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
     
    }
}
struct MainWeatherStatusView:View{
    var imageName: String
    var temperature:Int
    var body: some View
    {
        VStack(spacing:8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)")
                .font(.system(size: 32,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

