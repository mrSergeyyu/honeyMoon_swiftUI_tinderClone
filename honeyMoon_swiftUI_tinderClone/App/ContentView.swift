//
//  ContentView.swift
//  honeyMoon_swiftUI_tinderClone
//
//  Created by Sergey on 20.01.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK:- Properties
    
    @State var isPresentOnboardingView = false
    @State var isPresentAlert = false
    @State var isPresentsInfoView = false
    @State var lastCardIndex = 1
    @GestureState private var dragState = DragState.inactive
    private var dragPosition: CGFloat = 65.0
    
    //MARK:- Card views
   @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(place: places[index]))
        }
        return views
    }()
    
    //MARK:- Move cards
    private func moveCards () {
        cardViews.removeFirst()
        
        lastCardIndex += 1
        
        let cardView = places[lastCardIndex % places.count]
        
        let newCardView = CardView(place: cardView)
        
        cardViews.append(newCardView)
    }
    
    //MARK:- Top Card
    private func isTopCard(cardView: CardView) -> Bool {
      guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    //MARK:- Drag States
    enum DragState {
        
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            
            case .inactive, .pressing:
                return .zero
                
            case .dragging(translation: let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
                
            case .inactive, .pressing:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .dragging, .pressing:
                return true
                
            case .inactive:
                return false
            }
        }
    }
    
    
    
    //MARK:- Body
    var body: some View {
        VStack {
            
            //MARK:- Header
            HeaderView(isPresented: $isPresentOnboardingView, isPresentsInfo: $isPresentsInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            
            
            Spacer()
            
            //MARK:- Card
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                
                                Image(systemName: "x.circle")
                                    .font(.system(size: 124))
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0.0, y: 0.0)
                                    .opacity(dragState.translation.width < -dragPosition && isTopCard(cardView: cardView) ? 1 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .font(.system(size: 124))
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0.0, y: 0.0)
                                    .opacity(dragState.translation.width > dragPosition && isTopCard(cardView: cardView) ? 1 : 0)
                            }
                        )
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: isTopCard(cardView: cardView) ?  Double(dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.1)
                                    .sequenced(before: DragGesture())
                                    .updating($dragState, body: {
                                        (value, state, transaction) in
                                        switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                    .onEnded({(value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        if drag.translation.width < -dragPosition || drag.translation.width > dragPosition {
                                            moveCards()
                                        }
                                        
                                    })
                        )
                    
                }
            }
            
            Spacer()
            
            //MARK:- Footer
            FooterView()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            
        }//: VStack
        .padding(20)
        .alert(isPresented: $isPresentAlert, content: {
            Alert(title: Text("Success"), message: Text("Good job! /n You finally chose your trip"), dismissButton: .cancel(Text("Alright")))
        })
        
    }
}

//MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
