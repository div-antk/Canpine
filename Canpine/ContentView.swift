//
//  ContentView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [String] = ["ダニエル", "ゲオルグ", "ミヤギ", "アンド"]
    @State var isConfirm = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView {
            ZStack {
                // 背景色
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 24) {
                        
                        ForEach(users, id: \.self) { user in
                            
                            Button(action: {
                                self.isConfirm = true
                            }) {
                                HStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(.all, 20)
                                    VStack(alignment: .leading) {
                                        Text(user)
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.black)
                                        Text("東京都から")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.gray)
                                            .padding(.top, 2)
                                        Text("誕生日です")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.black)
                                            .padding(.top, 2)
                                        Text("ビール")
                                            .font(.system(size: 32, weight: .bold))
                                            .foregroundColor(.black)
                                            .padding(.top, 4)
                                    }
                                    Spacer()
                                }.padding()
                                
                                }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)
                        .modifier(CardModifier())
                        .padding(.horizontal, 16)
                    }
                }
            }
            .navigationTitle("カンパイ待ちです")
            .navigationBarItems(trailing: Button(action: {
                // Action
            }) {
                Image(systemName: "gearshape.fill")
            })
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
