//
//  HeaderView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 21.01.2021.
//

import SwiftUI

struct HeaderView: View {
    //MARK:- Properties
    @Binding var isPresented: Bool
    @Binding var isPresentsInfo: Bool
    
    //MARK:- Body
    var body: some View {
        HStack {
            Button(action: {
                isPresentsInfo.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            })
            .sheet(isPresented: $isPresentsInfo, content: {
                InfoView()
            })
            
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            })
            .sheet(isPresented: $isPresented, content: {
                OnboardingView()
            })
            
            
        }
    }
}

//MARK:- Preview
struct HeaderView_Previews: PreviewProvider {
    @State static var presentation = false
    @State static var presentation2 = false
    static var previews: some View {
        HeaderView(isPresented: $presentation, isPresentsInfo: $presentation2)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
