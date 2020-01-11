//
//  ContentView.swift
//  Practice
//
//  Created by Xiyu Zhang on 1/1/20.
//  Copyright © 2020 Xiyu Zhang. All rights reserved.
//

import SwiftUI

// This protocol deals with passing user-defined views to DraggableView.
// User should Create a struct that conforms to this Protocol and



struct ContentView: View {

    var body: some View {
        DraggableView<ProfileNavView, Text>(myViews:((ProfileNavView(), Text("Showed"))))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.edgesIgnoringSafeArea(.all)
    }
    }


struct DraggableView<T: View, W : View>: View {
    @State var currentOffset = -(UIScreen.main.bounds.width / 2)
    @State var isOpen = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let startOffset = -(UIScreen.main.bounds.width / 2)
    let endOffset = UIScreen.main.bounds.width / 2
    let myViews : (T, W)
    
    var body: some View {
        HStack(spacing: CGFloat.zero){
               VStack{
                    self.myViews.0
               }
               .frame(width: self.width, height: self.height)
               .background(Color.blue)
            
               VStack{
                    self.myViews.1
               }
               .frame(width: self.width, height: self.height)
        }
         .background(Color.white)
         .offset(x: self.currentOffset)
        .animation(.easeOut(duration: 0.15))
         .gesture(DragGesture()
               .onChanged { value in
                   if ((value.translation.width <= 0 && self.currentOffset > self.startOffset) || (value.translation.width >= 0 && self.currentOffset < self.endOffset)) {
                    self.currentOffset = (self.isOpen ? self.endOffset : self.startOffset) + CGFloat(value.translation.width)
                   }
               }
               .onEnded { value in
                   if (self.isOpen) {
                       if (value.translation.width < -(self.width / 2)) {
                           self.currentOffset = self.startOffset
                           self.isOpen.toggle()
                       } else {
                           self.currentOffset = self.endOffset
                           
                       }
                   } else {
                       if (value.translation.width > self.width / 2) {
                           self.currentOffset = self.endOffset
                           self.isOpen.toggle()
                       } else {
                           self.currentOffset = self.startOffset
                       }
                   }
               }
           )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
