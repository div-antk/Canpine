//
//  CheerPopUpView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/06.
//

import Foundation
import SwiftUI
import ExytePopupView

struct CheerPopUpView: View {
    
    @Binding var isPopUp: Bool
    
    var body: some View {
        HStack {
            Text("opup")
        }
        .frame(width: 200, height: 60)
        .background(Color(red: 0.85, green: 0.8, blue: 0.95))
        .cornerRadius(30.0)
    }
}
