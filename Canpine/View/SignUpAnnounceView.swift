//
//  SignUpAnnounceView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/28.
//

import SwiftUI

struct SignUpAnnounceView: View {
    
    @State private var isActiveSignUpAnnounce = false
    
    var body: some View {
        VStack(spacing: 16){
            Text("Canpineに登録して\nカンパイしましょう🍻")
                .font(.system(size: 16, weight: .bold))
                .padding(.top, 32)
            Button(action: {
                isActiveSignUpAnnounce = true
            }) {
                Text("登録する")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, minHeight: 28)
                    .background(Color.orange)
                    .cornerRadius(4)
                    .padding(.horizontal, 32)
                    .fullScreenCover(isPresented: $isActiveSignUpAnnounce) {
                        SignUpView(isShowSignUp: $isActiveSignUpAnnounce)
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
            Button(action: {
                isActiveSignUpAnnounce = true
            }) {
                Image("twitter_circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.bottom, 20)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .padding(16)
    }
}

struct SignUpAnnounce_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAnnounceView()
    }
}
