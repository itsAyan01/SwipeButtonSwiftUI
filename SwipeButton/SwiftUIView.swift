//
//  SwiftUIView.swift
//  SwipeButton
//
//  Created by Dr.Mac on 19/10/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset: CGFloat = 0
    @State var customWidth: CGFloat = 0
    
    var body: some View {
        VStack {
            
            ZStack {
                Color.red.opacity(0.5)
                
                ZStack {
                    
                    HStack {
                        Rectangle()
                            .fill(.red.opacity(0.01))
                            .frame(width: customWidth)
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 30, height: 30)
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text("This is the text to be checked")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(.black.opacity(0.8))
                }
                
            }
            .frame(height: 60)
            .onAppear {
                withAnimation(.linear(duration: 3)) {
                    customWidth = maxWidth
                }
            }
            
        }
    }
    
    
    func calculateWidth() {
            customWidth += 1
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
