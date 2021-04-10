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
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 140)
                    Spacer()
                    Text(status)
                        .font(.system(size: 16, weight: .bold))
                        + Text("の\n")
                        .font(.system(size: 16))
                        + Text(name)
                        .font(.system(size: 16, weight: .bold))
                        + Text("さんとカンパイする？")
                        .font(.system(size: 16))
                    Button(action: {
                        isActiveCheerPopup = false
                    }) {
                        Text("🍻")
                            .font(.system(size: 32))
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .cornerRadius(40.0)                    }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 320)
            .background(Color.orange)
            .cornerRadius(12)
            .padding(.horizontal, 32)
            .padding(.bottom, 80)
        }
    }
}
