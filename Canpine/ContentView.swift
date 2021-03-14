//
//  ContentView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [String] = ["ダニエル", "ゲオルグ", "ミヤギ"]
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView {
            ZStack {
                // 背景色
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        ForEach(users, id: \.self) { user in
                            
                            HStack(alignment: .center) {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .padding(.all, 20)
                                VStack(alignment: .leading) {
                                    Text(user)
                                        .font(.system(size: 24, weight: .bold))
                                    Text("東京都")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.gray)
                                    Text("誕生日")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding(.top, 8)
                                }
                            }.padding(.trailing, 20)
                            Spacer()
                        }
//                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowBackground(Color.white)
//                        .modifier(CardModifier())
//                        .padding(.all, 10)
                        
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
