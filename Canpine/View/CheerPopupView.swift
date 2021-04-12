//
//  CheerPopupView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/06.
//

import Foundation
import SwiftUI
import ExytePopupView

struct CheerPopupView: View {
    
    @Binding var isActiveCheerPopup: Bool
    @Binding var name: String
    @Binding var status: String
    @Binding var item: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isActiveCheerPopup = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            }.padding(EdgeInsets(
                top: 0, leading: 0, bottom: 0, trailing: 32
            ))
            ZStack {
                VStack(spacing: 20) {
                    // イメージ画像が設定されていない場合はアイコン画像を表示しない（UIをビールに見立てる）
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 100)
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                        .padding(.top, -50)
//                    Spacer()
                    Text(status)
                        .font(.system(size: 14, weight: .bold))
                        + Text("の\n")
                        .font(.system(size: 14))
                        + Text(name)
                        .font(.system(size: 14, weight: .bold))
                        + Text("さんとカンパイする？")
                        .font(.system(size: 14))
                    Button(action: {
                        isActiveCheerPopup = false
                    }) {
                        Text("🍻")
                            .font(.system(size: 32))
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .cornerRadius(40)
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 320)
            .background(Color.orange)
            .cornerRadius(12)
            .padding(.horizontal, 32)
        }
    }
}
