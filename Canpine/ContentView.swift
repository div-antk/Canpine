//
//  ContentView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/13.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    
    @State var isStandby = false
    @State var isLogIn = true
    @State var showSignUp = false
    @State var showCheerPopUp = false
    @State var showPartial = false
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack {
            // 背景色
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(usersData) { user in
                        Button(action: {
                            if isLogIn {
                                print("ログイン中の処理")
                                withAnimation {
                                    showCheerPopUp.toggle()
                                }
                            } else {
                                showSignUp.toggle()
                            }
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
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .padding(.top, 2)
                                    Text(user.item)
                                        .font(.system(size: 20, weight: .bold))
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
            VStack {
                ConfigButton(showPartial: $showPartial)
            }
        }
        .popup(isPresented: $showCheerPopUp, autohideIn: nil) {
            CheerPopUpView(isPopUp: $showCheerPopUp)
//            HStack {
//                Text("opup")
//            }
//            .frame(width: 200, height: 60)
//            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
//            .cornerRadius(30.0)
        }
        .addPartialSheet(style: PartialSheetStyle(
            background: .solid(Color.white),
            handlerBarColor: Color.white,
            enableCover: true, // 背景タップの許可
            coverColor: Color.black.opacity(0.4), // 背景
            cornerRadius: 4,
            minTopDistance: 0 // 上部から最低どれくらい空けるか
        ))
        .partialSheet(isPresented: $showPartial) {
            ConfigView(isStandby: $isStandby)
        }
        .partialSheet(isPresented: $showSignUp) {
            SignUpAnnounce()
        }
    }
}

struct ConfigButton: View {
    
    @Binding var showPartial: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showPartial.toggle()
                }) {
                    
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.gray)
                        .cornerRadius(30.0)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
                }
            }
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
