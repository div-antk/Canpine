//
//  ConfigView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/19.
//

import SwiftUI
import PartialSheet

struct ConfigView: View {
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @State var status = 
    
    var body: some View {
        VStack {
            VStack {
                Text("あなたの設定").font(.headline)
            }
            VStack {
                Text("ステータス").font(.headline)
            }
            .padding()
            .frame(height: 250)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
