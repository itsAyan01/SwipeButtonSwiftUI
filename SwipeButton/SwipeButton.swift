//
//  SwipeButton.swift
//  SwipeButton
//
//  Created by Dr.Mac on 19/10/22.
//

import SwiftUI

/// it is a reusable swipe button,
/// hintText = pass text to show on hint,
/// thumbColor = pass color for slider button,
/// sliderPathColor = pass color for slider background,
/// onSwipe = perform action on swipe,
struct SwipeButton: View {
    
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset: CGFloat = 0
    var hintText: String = "Swipe to place order"
    var thumbColor: Color = .orange
    var sliderPathColor: Color = .yellow
    var onSwipe: () -> Void

    var body: some View {
        ZStack {
            sliderPathColor.opacity(0.5)
            
            Text(hintText)
            
            HStack {
                Rectangle()
                    .strokeBorder(.green, lineWidth: 1)
                    .overlay(Color.green.opacity(0.6))
                    .frame(width: calculateWidth())
                
                Spacer(minLength: 0)
            }
            
            HStack {
                ZStack {
                    Image(systemName: "chevron.right.2")
                    
                }
                .frame(width: 60, height: 60)
                .background(thumbColor)
                .offset(x: offset)
                .gesture(
                    DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:))
                )
                
                Spacer()
            }
            
        }
        .frame(width: maxWidth, height: 60)
        .padding(.horizontal)
        
        
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width > 0 && offset <= maxWidth - 60 {
            offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        
        withAnimation(.easeInOut) {
            if offset > 160 {
                offset = maxWidth - 60
                onSwipe()
            } else {
                offset = 0
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        let percent = offset / maxWidth
        return percent * maxWidth
    }
    
    
}

struct SwipeButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeButton() { }
    }
}
