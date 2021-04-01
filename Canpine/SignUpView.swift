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
    
    @Binding var isActive: Bool
        
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isActive = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
//                                .frame(width: 20)
                        }
                    }.padding(EdgeInsets(
                    top: 80, leading: 0, bottom: 40, trailing: 32
                    ))
                }
                VStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("ニックネーム")
                        .foregroundColor(.black)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 32)
                    TextField("Your Beautiful Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 32)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        if mailErrorMessage != "" {
                            Text(mailErrorMessage)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                        } else {
                            Text("メールアドレス")
                                .foregroundColor(.black)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 32)
                        }
                        TextField("email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 32)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        if passWordErrorMessage != "" {
                            Text(passWordErrorMessage)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                        } else {
                            Text("パスワード")
                                .foregroundColor(.black)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 32)
                        }
                        SecureField("password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 32)
                    }
                }.padding(.bottom, 40)
                
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
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isActive: .constant(false))
    }
}
