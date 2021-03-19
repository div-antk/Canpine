//
//  ContentView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/13.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    
    @State var isConfirm = false
    @State var showPartial = false
        
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
                        ForEach(usersData) { user in
                            Button(action: {
                                self.isConfirm = true
                            }) {
                                HStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                        .padding(.all, 12)
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(user.name)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.black)
                                            Text("🍻\(user.star)")
                                                .font(.system(size: 16))
                                                .foregroundColor(.black)
                                        }
                                        Text("\(user.place)から")
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                            .padding(.top, 1)
                                        Text("\(user.status)です")
                                            .font(.system(size: 16))
                                            .foregroundColor(.black)
                                            .padding(.top, 2)
                                        Text(user.item)
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.black)
                                            .padding(.top, 2)
                                    }
                                    Spacer()
                                }.padding()
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)
                        .modifier(CardModifier())
                        .padding(.horizontal, 24)
                    }
                }
            }
            .navigationTitle("カンパイ待ちです")
            .navigationBarItems(trailing: Button(action: {
                showPartial.toggle()
            }) {
                Image(systemName: "gearshape.fill")
            })
        }
        .addPartialSheet()
        .partialSheet(isPresented: $showPartial) {
            ConfigView()
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
