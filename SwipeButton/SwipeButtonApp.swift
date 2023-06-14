//
//  SwipeButtonApp.swift
//  SwipeButton
//
//  Created by Dr.Mac on 19/10/22.
//

import SwiftUI

@main
struct SwipeButtonApp: App {
    var body: some Scene {
        WindowGroup {
            SwipeButton {
                print("Swiped")
            }
        }
    }
}
  
