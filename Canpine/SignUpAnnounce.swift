//
//  SignUpAnnounce.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/28.
//

import SwiftUI

struct SignUpAnnounce: View {
    
    @State private var isShowing = false
    
    var body: some View {
        VStack{
            Text("Canpineにジョインしてカンパイしましょう🍻")
                .font(.system(size: 12))

            Button(action: {
                isShowing = true
            }) {
                Text("登録する")
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .frame(height: 48)

                    .padding(.horizontal, 32)
                    .sheet(isPresented: $isShowing) {
                        SignUpView()
                    }
            }
//            Button("登録する") {
//                isShowing = true
//            }.foregroundColor(Color.white)
//            .accentColor(Color.white)
//            .background(Color.orange)
//            .frame(height: 24)
//            .padding(.horizontal, 16)
//            .sheet(isPresented: $isShowing) {
//                SignUpView()
//            }
            ZStack {
            Text("or")
                .fontWeight(.bold)
                .font(.system(size: 12))
                .background(Color.white)
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct SignUpAnnounce_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAnnounce()
    }
}
