//
//  MainView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/13.
//

import SwiftUI
import PartialSheet
import KeyboardObserving
import ExytePopupView

struct MainView: View {
    
    // 遷移する際の変数は showHoge
    // モーダルを閉じるための変数は activeHoge
    @State var isStandby = false // カンパイ待ちかどうか
    @State var isLogIn = true
    @State var showSignUp = false
    @State var showCheerPopup = false
    @State var showConfig = false
    @State var showSearch = false
    
    @State var name = ""
    @State var item = ""
    @State var status = ""
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack {
            // 背景色
            Color.orange
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(usersData) { user in
                        Button(action: {
                            if isLogIn {
                                print("ログイン中の処理")
                                //                                withAnimation {
                                showCheerPopup.toggle()
                                name = user.name
                                status = user.status
                                item = user.item
                                //                                }
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
                Spacer()
                HStack {
                    ConfigButton(showPartial: $showConfig)
                        .animation(.default)
                    Spacer()
                    SearchButton(showSearch: $showSearch)
                        .animation(.default)

                }
                // 検索画面を出した際に背景を暗くする
                if showSearch {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        // 検索画面
//        .popup(
//            isPresented: $showSearch,
//            type: .default,
//            position: .top, // 上から出現させる
//            autohideIn: nil,
//            closeOnTap: false
//        ) {
//            SearchView (showSearch: $showSearch)
//                .keyboardObserving()
//        }
        
        .addPartialSheet(style: PartialSheetStyle(
            background: .solid(Color.clear),
            handlerBarColor: Color.clear,
            enableCover: true, // 背景タップの許可
            coverColor: Color.black.opacity(0.5), // 背景
            cornerRadius: 4,
            minTopDistance: 0 // 上部から最低どれくらい空けるか
        ))
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .partialSheet(isPresented: $showSearch) {
            SearchView(showSearch: $showSearch)
        }
        .partialSheet(isPresented: $showConfig) {
            ConfigView(isStandby: $isStandby)
        }
        .partialSheet(isPresented: $showCheerPopup) {
            CheerPopupView(
                isShowCheerPopup: $showCheerPopup,
                name: $name,
                status: $status,
                item: $item
            )
        }
        .partialSheet(isPresented: $showSignUp) {
            SignUpAnnounceView()
        }
    }
}

struct ConfigButton: View {
    
    @Binding var showPartial: Bool
    
    var body: some View {
        
        Button(action: {
            showPartial.toggle()
        }) {
            Image(systemName: "gearshape.fill")
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.gray)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 0))
        }
    }
}

struct SearchButton: View {
    
    @Binding var showSearch:Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation() {
                showSearch.toggle()
            }
        }) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 32))
            
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
        // TODO: 影が必要か考える
        // .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
