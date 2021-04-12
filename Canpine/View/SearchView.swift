//
//  SearchView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/12.
//

import SwiftUI
import ExytePopupView

struct SearchView: View {
    
    @Binding var showSearch: Bool
    @State var userId = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // TODO: 状態名を考える
            Text("探しましょう")
                .font(.system(size: 12, weight: .bold))
                .padding(.horizontal, 32)
            TextField(userId, text: $userId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 32)
    }
    
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(showSearch: )
//    }
//}
