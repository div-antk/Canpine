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
                .font(.system(size: 14))
                .padding(.bottom, 24)
            Button(action: {
                isShowing = true
            }) {
                Text("登録する")
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, minHeight: 28)
                    .background(Color.orange)
                    .cornerRadius(4)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
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
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 1)
                    .padding(.horizontal, 16)
            Text("or")
                .fontWeight(.bold)
                .font(.system(size: 12))
                .frame(width: 24)
                .background(Color.white)

            }
        }
    }
}

struct SignUpAnnounce_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAnnounce()
    }
}
