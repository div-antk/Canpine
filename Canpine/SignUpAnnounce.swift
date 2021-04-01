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
            Text("Canpineに登録して\nカンパイしましょう🍻")
                .font(.system(size: 16, weight: .bold))
                .padding(.bottom, 16)
            Button(action: {
                isShowing = true
            }) {
                Text("登録する")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, minHeight: 28)
                    .background(Color.orange)
                    .cornerRadius(4)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 12)
                    .fullScreenCover(isPresented: $isShowing) {
                        SignUpView()
                    }
            }
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 1)
                    .padding(.horizontal, 32)
                Text("or")
                    .font(.system(size: 12, weight: .bold))
                    .frame(width: 24)
                    .background(Color.white)
            }
            .padding(.bottom, 12)
            Button(action: {
                isShowing = true
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.gray)
                    .cornerRadius(20.0)
            }
        }
    }
}

struct SignUpAnnounce_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAnnounce()
    }
}
