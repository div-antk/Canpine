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
                top: -30, leading: 0, bottom: 0, trailing: 32
            ))
        ZStack {
            
            
            Text("opup")
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 32)
        }
    }
}
