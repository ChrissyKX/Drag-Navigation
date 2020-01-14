//
//  DraggableView.swift
//  Practice
//
//  Created by Xiyu Zhang on 1/10/20.
//  Copyright © 2020 Xiyu Zhang. All rights reserved.
//

import SwiftUI
import Combine

// This class allows argument views of DraggableView to control the current page of the DraggableView,
// with 0, 1, 2 be the left, middle, and right views.
//class CurrentPage {
//    // Page number started from 0
//    var page : Int
//
//    init (_ page: Int) {
//        self.page = page
//    }
//
//    func turnTo(page: Int) {
//        self.page = page
//    }
//}

struct DraggableView<T: View, W : View>: View {
    @State var currentOffset = -(UIScreen.main.bounds.width / 2)
    // This variable controls the current page of the DraggableView,
    // with 0, 1, 2 be the left, middle, and right views.
    @State var currentPage = 1
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let startOffset = -(UIScreen.main.bounds.width / 2)
    let endOffset = UIScreen.main.bounds.width / 2
    let myViews : (@escaping (Int) -> ()) -> (T, W)
    
    func turnToPage(page: Int) {
        currentPage = page
        self.currentOffset = self.currentPage == 0 ? self.endOffset : self.startOffset
    }
    
    
    var body: some View {
        HStack(spacing: CGFloat.zero){
            
            VStack{
                self.myViews(turnToPage(page:)).0
            }
            .frame(width: self.width, height: self.height)
            .background(Color.blue)
            
            VStack{
                self.myViews(turnToPage(page:)).1
            }
            .frame(width: self.width, height: self.height)
        }
        .background(Color.white)
        .offset(x: self.currentOffset)
        .animation(.easeOut(duration: 0.15))
        .gesture(DragGesture()
        .onChanged { value in
            if ((value.translation.width <= 0 && self.currentOffset > self.startOffset)
                || (value.translation.width >= 0 && self.currentOffset < self.endOffset)) {
                self.currentOffset = (self.currentPage == 0 ? self.endOffset : self.startOffset) + CGFloat(value.translation.width)
            }
        }
        .onEnded { value in
            if (self.currentPage == 0) {
                if (value.translation.width < -(self.width / 2)) {
                    self.turnToPage(page: 1)
                } else {
                    self.currentOffset = self.endOffset
                    
                }
            } else {
                if (value.translation.width > self.width / 2) {
                    self.turnToPage(page: 0)
                } else {
                    self.currentOffset = self.startOffset
                }
            }
            }
        )
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView<Text, Text> { currentPage in
            (Text(""), Text(""))
        }
    }
}
