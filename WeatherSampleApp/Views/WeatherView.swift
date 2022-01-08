//
//  WeatherView.swift
//  WeatherSampleApp
//
//  Created by Juan Carlos Pazos on 06/01/22.
//
/*
 Simple weather application
 Use: Core Location - async - Open Weather API
 Go to https://openweathermap.org and get your key for use this code
 Key goes in WeatherManager file
 */

import SwiftUI

struct WeatherView: View {
    // MARK: - Properties
    var weather: ResponseBody
    
    // MARK: - Body
    var body: some View {
        
        ZStack(alignment: .leading) {
            // MARK: - City and date
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Simple Weather App")
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 6)
                    
                    Text(weather.name)
                        .bold()
                        .font(.headline)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .font(.subheadline)
                } // VSTack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // MARK: - Temperature
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    } // HStack
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                } // VStack
                .frame(maxWidth: .infinity)
            } // VStack
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Weather details
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value:
                                    (weather.main.tempMin
                                    .roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value:
                                    (weather.main.tempMax
                                    .roundDouble() + "°"))
                    } // HStack
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value:
                                    (weather.wind.speed
                                    .roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value:
                                    (weather.main.humidity
                                    .roundDouble() + "%"))
                    } // HStack
                    
                } // VStack
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            } // VStack
        } // ZStack
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

// MARK: - Copyright notice
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish, distribute, sublicense, create a derivative work, and/or sell copies of the Software in any work that is designed, intended, or marketed for pedagogical or instructional purposes related to programming, coding, application development, or information technology.  Permission for such use, copying, modification, merger, publication, distribution, sublicensing, creation of derivative works, or sale is expressly withheld.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
