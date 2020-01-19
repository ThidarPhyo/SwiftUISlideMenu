//
//  ContentView.swift
//  SwiftUISlideMenu
//
//  Created by Thidar Phyo on 1/19/20.
//  Copyright © 2020 Thidar Phyo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var open = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {self.open.toggle()}) {
                        //Text("Open Menu")
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }.padding()
            
            Menu(open: $open)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Menu(open: .constant(true))
    }
}
struct Menu: View {
    @Binding var open: Bool
    var body: some View {
        VStack {
            HStack {
                //Text("Menu")
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                .frame(width: 32, height: 32)
                
                ZStack {
                    Image("iu")
                    .resizable()
                    .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding(.horizontal, 24)
                    
                    Circle()
                        .stroke(Color.purple)
                    .frame(width: 70, height: 70)
                    .offset(x: -2, y: -1)
                    
                    Circle()
                        .stroke(Color.green)
                    .frame(width: 70, height: 70)
                    .offset(x: 2, y: 1)
                }
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                .frame(width: 32, height: 32)
            }
            .padding(.top, 20)
            Text("Thidar")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
                .padding(.top, 10)
                .padding(.bottom, 40)
            Row(rowActive: false, icon: "house", text: "Home ")
            Row(rowActive: false, icon: "person", text: "Profile ")
            Row(rowActive: false, icon: "person.3", text: "Followers ")
            Row(rowActive: false, icon: "heart", text: "Favourites ")
            Spacer()
            Row(rowActive: false, icon: "arrow.uturn.left", text: "Sign Out ")
        }
        .padding(.vertical, 30)
        .background(Color.purple)
        .padding(.trailing, 80)
        .offset(x: open ? 0 : -UIScreen.main.bounds.width)
        .rotation3DEffect(Angle(degrees: open ? 0 : 45), axis: (x: 0, y: 20, z: 0))
        .animation(.default)
        .onTapGesture {
            self.open.toggle()
        }
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

struct Row: View {
    var rowActive: Bool
    var icon = "house"
    var text = "Dashboard"
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(rowActive ? Color.purple : .white)
                .font(.system(size: 15, weight: rowActive ? .bold : .regular))
                .frame(width: 48, height: 32)
            Text(text)
                .foregroundColor(rowActive ? Color.purple : .white)
                .font(.system(size: 15, weight: rowActive ? .bold : .regular))
            Spacer()
        }
    .padding(4)
        .background(rowActive ? Color.white : Color.white.opacity(0))
        .padding(.trailing, 20)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .offset(x: 20)
    }
}

