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
        ZStack {
            
            
            Text("opup")
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(Color(red: 0.85, green: 0.8, blue: 0.95))
        .cornerRadius(12)
        .padding(.horizontal, 32)
    }
}
