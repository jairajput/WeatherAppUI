//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Jai  on 28/04/23.
//

import SwiftUI

struct WeatherButton : View{
    
    var title:String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View
    {
        Text(title)
            .frame(width: 280,height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 22,weight: .medium))
            .cornerRadius(10)
    }
}
