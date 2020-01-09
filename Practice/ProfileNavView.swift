//
//  ProfileNavView.swift
//  Practice
//
//  Created by Xiyu Zhang on 1/8/20.
//  Copyright © 2020 Xiyu Zhang. All rights reserved.
//

import SwiftUI

struct ProfileNavView: View {
    var body: some View {
        ZStack {
            Header()
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .edgesIgnoringSafeArea(.all)
                .background(Color.blue)
                
            VStack {
                Text("Nav")
            }
        }
    }
}

struct Header: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack() {
            Image("Rabbits")
                .resizable()
                .frame(width: self.width, height: self.height)
                .clipShape(Rectangle().scale(x: 1, y: 1/3, anchor: .top))
            Image("ProfilePic")
                .resizable()
                .frame(width: self.height / 10, height: self.height / 10)
                .clipShape(Circle().scale(0.95))
                .overlay(Circle().scale(0.95).stroke(Color.white, lineWidth: 3))
                .offset(x: -(self.width / 3), y: -(self.height / 4))
            
        
        }
      
        
        
    }
}

struct ProfileNavView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavView()
    }
}
