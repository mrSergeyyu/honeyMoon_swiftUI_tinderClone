//
//  OnboardingComponentView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 23.01.2021.
//

import SwiftUI

struct OnboardingComponentView: View {
    //MARK:- Properties
    var image: String
    var title: String
    var action: String
    var description: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38, alignment: .center)
                .foregroundColor(.pink)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title.uppercased())
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(action.uppercased())
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                
                        }
                        .padding(.vertical, -5)
                        
                        Divider()
                        
                        Text(description)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

struct OnboardingComponentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingComponentView(image: "heart.circle", title: "LIKE", action: "swipe right", description: "Do you like whis destination? Touch the screen and swipe right. It will be saved to favorites.")
    }
}
