//
//  ProfileNavView.swift
//  Practice
//
//  Created by Xiyu Zhang on 1/8/20.
//  Copyright © 2020 Xiyu Zhang. All rights reserved.
//

import SwiftUI

struct ProfileNavView: View {
    let turnToPage: (Int) -> ()
    
    var body: some View {
        ZStack {
            Header(turnToPage: turnToPage)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.red)
            
            VStack {
                Text("Nav")
            }
        }
    }
}

struct Header: View {
    let turnToPage: (Int) -> ()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Image("Rabbits")
                .resizable()
                .frame(width: self.width, height: self.height)
                .clipShape(Rectangle().scale(x: 1, y: 1/3, anchor: .top))
            VStack(spacing: self.height / 7) {
                HStack {
                    Spacer()
                    Button(action: {
                        self.turnToPage(1)
                    }) {
                        Image(systemName: "multiply")
                            .scaleEffect(1.5)
                    }.foregroundColor(.white)
                        .padding(.trailing, self.width / 15)
                }
                
                 HStack {
                    Image("ProfilePic")
                      .resizable()
                      .frame(width: self.height / 10, height: self.height / 10)
                      .clipShape(Circle().scale(0.95))
                      .overlay(Circle().scale(0.95).stroke(Color.white, lineWidth: 3))
                      
                        
                    VStack(alignment: .leading, spacing: 15) {
                        Text("My Name").font(.system(size: 25))
                        HStack {
                            Button(action: {
                                //
                            }){
                                Image(systemName: "square.and.pencil")
                            }.padding(.bottom, 5)
                            Text("My Signature")
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(height: self.height / 4)
            .padding(self.width / 15)
            .offset(y: -(self.height / 3.2))
        }
        
    }
}

//struct ProfileNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileNavView(currentPage: Binding<CurrentPage>($CurrentPage(0)))
//            .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
//    }
//}
