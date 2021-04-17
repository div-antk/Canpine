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
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("カンパイを受ける")
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 32)
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 42)
                        .cornerRadius(4)
                        .padding(.horizontal, 32)
                    Toggle(isOn: $isStandby, label: {
                        Text(isStandby ? "はい" : "いいえ")
                            .font(.system(size: 14, weight: .bold))
                    })
                    .padding(.horizontal, 42)
                }.padding(.bottom, 8)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                VStack(alignment: .leading, spacing: 4) {
                    // TODO: 状態名を考える
                    Text("どんなきぶん？")
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal, 32)
                    TextField(status, text: $status)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 32)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("飲みもの🍺")
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal, 32)
                    TextField(item, text: $item)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 32)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            .frame(height: 240)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    
    @Binding var isStandby: Bool
    
    static var previews: some View {
        ConfigView(isStandby: .constant(false))
    }
}
