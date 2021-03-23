//
//  InitialView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/21.
//

import SwiftUI

struct InitialView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @State var errorMessage = ""
    @State var isError = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            VStack {
                VStack {
                    Text("ようこそCanpineへ！")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("カンパイしましょう🍻")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }.padding(.bottom, 20)
                VStack(spacing: 20) {
                    TextField("あなたの名前", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 60)
                    TextField("email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 60)
                        .keyboardType(.emailAddress)
                    SecureField("password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 60)
                }.padding(.bottom, 20)
                VStack {
                    Text(errorMessage)
                    Button("👍") {
                        if email.isEmpty {
                            errorMessage = "メールアドレスを入力してください"
                            isError = true
                        } else if password.isEmpty {
                            errorMessage = "ただしいパスワードを入力してください"
                            isError = true
                        } else {
                            print("サインアップ")
                        }
                        print(name, email, password)
                    }.frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30.0)
                }
            }
        }
    }
}


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
