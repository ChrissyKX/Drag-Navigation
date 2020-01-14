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
        DraggableView<ProfileNavView, Text> { turnToPage in
            (ProfileNavView(turnToPage: turnToPage), Text("Showed"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        //.edgesIgnoringSafeArea(.all)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
