//
//  SignUpView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @State var mailErrorMessage = ""
    @State var passWordErrorMessage = ""
    @State var isError = false
        
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            VStack {
                VStack {
                    Text("カンパイしましょう🍻")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }.padding(.bottom, 20)
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("ニックネーム")
                        .font(.caption)
                        .padding(.horizontal, 30)
                    TextField("Your Beautiful Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 30)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        if mailErrorMessage != "" {
                            Text(mailErrorMessage)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                        } else {
                            Text("メールアドレス")
                                .font(.caption)
                                .padding(.horizontal, 30)
                        }
                        TextField("email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 30)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        if passWordErrorMessage != "" {
                            Text(passWordErrorMessage)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                        } else {
                            Text("パスワード")
                                .font(.caption)
                                .padding(.horizontal, 30)
                        }
                        SecureField("password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 30)
                    }
                }.padding(.bottom, 20)
                
                VStack {
                    Button("👍") {
                        if email.isEmpty {
                            mailErrorMessage = "メールアドレスを入力してください"
                            isError = true
                        }
                        if password.isEmpty {
                            passWordErrorMessage = "ただしいパスワードを入力してください"
                            isError = true
                        }
                        print("サインアップ")
                        print(name, email, password)
                    }.frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30.0)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
