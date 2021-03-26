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
    @State var status = "飲みたい"
    @State var item = "ビール"
    @Binding var isStandby: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Toggle(isOn: $isStandby, label: {
                    Text(isStandby ? "カンパイ待ち" : "OFF")
                })
                Text("ステータス")
                    .font(.subheadline)
                TextField(status, text: $status)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("もちもの🍺")
                    .font(.subheadline)
                TextField(item, text: $item)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            .frame(height: 250)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    
    @Binding var isStandby: Bool

    static var previews: some View {
        ConfigView(isStandby: .constant(false))
    }
}
