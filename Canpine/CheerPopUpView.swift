//
//  CheerPopUpView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/06.
//

import Foundation
import SwiftUI

struct CheerPopUpView: View {
    
    @Binding var isPopUp: Bool
    
    var body: some View {
        ZStack {
            Text("ショボーン")
        }
        .frame(width:300, height: 300)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 20)
    }
}
