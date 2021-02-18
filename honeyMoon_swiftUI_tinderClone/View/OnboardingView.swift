//
//  OnboardingView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 22.01.2021.
//

import SwiftUI

struct OnboardingView: View {
    //MARK:- Properties
    @Environment (\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 180, idealWidth: 230, maxWidth: 260)
                .padding(.vertical, 20)
            
            Spacer()
            
            Text("Get started!")
                .font(.system(size: 38, weight: .heavy, design: .rounded))
                .foregroundColor(.pink)
            
            Text("Discover and pick the perfect destination for your romantic Honeymoon")
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            
            Spacer()
            
            OnboardingComponentView(image: "heart.circle", title: "like", action: "swipe right", description: "Do you like whis destination? Touch the screen and swipe right. It will be saved to favorites.")
            
            OnboardingComponentView(image: "xmark.circle", title: "dismiss", action: "swipe left", description: "Would you rather skip this place? Touch the screen and swipe left. You will never see it.")
            
            OnboardingComponentView(image: "checkmark.circle", title: "book", action: "Tap the button", description: "Our selection of honeymoon resorts is perfect settings for you to embarc your new life together.")
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("continue".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().fill(Color.pink).frame(width: 260, height: 60, alignment: .center))
                    .padding()
                    
            })
            
        }//: VStack
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
