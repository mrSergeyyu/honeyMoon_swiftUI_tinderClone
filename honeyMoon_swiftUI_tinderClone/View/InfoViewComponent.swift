//
//  InfoViewComponent.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 26.01.2021.
//

import SwiftUI

struct InfoViewComponent: View {
    //MARK:- Properties
    
    var title: String
    var message: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(message)
        }
        
    }
}

struct InfoViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewComponent(title: "Application", message: "Honeymoon")
    }
}
