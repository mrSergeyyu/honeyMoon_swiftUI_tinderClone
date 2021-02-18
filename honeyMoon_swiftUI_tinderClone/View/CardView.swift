//
//  CardView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 21.01.2021.
//

import SwiftUI

struct CardView: View, Identifiable {
    //MARK:- Properties
    var place: Place
    var id = UUID()
    
    //MARK:- Body
    var body: some View {
        Image(place.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(24)
            .overlay(
                VStack(spacing: 20) {
                    Text(place.place.uppercased())
                        .font(.system(.title, design: .rounded))
                        .bold()
                       
                    
                    Text(place.country)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Capsule())
                        
                    
                    
                }//: VStack
                .padding(.vertical, 40)
                .foregroundColor(.white)
                .overlay(
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 2)
                )//: Overlay
                , alignment: .bottom
            )//: Overlay
    }
}

//MARK:- Preview
struct CardView_Previews: PreviewProvider {
   static var cities: [Place] = places
    static var previews: some View {
        CardView(place: places[0])
            .previewLayout(.fixed(width: 375, height: 600))
            .padding()
    }
}
