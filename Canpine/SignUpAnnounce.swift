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
            Text("Canpineにジョインしてカンパイしましょう🍻")
            Button("登録する") {
                isShowing = true
            }.foregroundColor(.white)
            .accentColor(Color.white)
            .background(Color.orange)
            .frame(width: 300, height: 60)
            .sheet(isPresented: $isShowing) {
                SignUpView()
            }
            Text("もしくは。。")
        }
    }
}

struct SignUpAnnounce_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAnnounce()
    }
}
