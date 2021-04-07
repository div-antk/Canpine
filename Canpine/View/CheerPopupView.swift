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
            Text("\(status)の\n\(name)さんとカンパイする？")
                .font(.system(size: 14))

        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 32)
        .padding(.bottom, 80)
        }
    }
}
