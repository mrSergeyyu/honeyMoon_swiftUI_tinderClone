//
//  InfoView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 25.01.2021.
//

import SwiftUI

struct InfoView: View {
    //MARK:- Properties
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 180, idealWidth: 230, maxWidth: 260)
                .padding(.vertical, 20)
            
            Text("Info App")
                .font(.system(size: 38, weight: .heavy, design: .rounded))
                .foregroundColor(.pink)
            
            Form(content: {
                
                Section(
                        content: {
                            
                            InfoViewComponent(title: "Application", message: "Honeymoon")
                            
                            InfoViewComponent(title: "Compatibility", message: "iOS / iPad")
                            
                            InfoViewComponent(title: "Developer", message: "Sergey Yurikov")
                            
                            InfoViewComponent(title: "Designer", message: "Robert Patras")
                            
                            InfoViewComponent(title: "Version", message: "1.0.0")
                            
                            
                        })
            })
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .compact)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Coutinue")
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().fill(Color.pink).frame(width: 260, height: 60, alignment: .center))
                    .padding()
            })
            
        }//:VStack
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
