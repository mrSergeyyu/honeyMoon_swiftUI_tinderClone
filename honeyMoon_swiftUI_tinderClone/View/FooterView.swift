//
//  FooterView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 22.01.2021.
//

import SwiftUI

struct FooterView: View {
    //MARK:- Properties
    
    //MARK:- Body
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42, alignment: .center)
            
            Spacer()
            
            Text("Book destination".uppercased())
                .font(.system(.headline, design: .rounded))
                .padding()
                .foregroundColor(.pink)
                .background(Capsule().stroke(lineWidth: 2).fill(Color.pink))
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42, alignment: .center)
            
        }
    }
}

//MARK:- Preview
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
