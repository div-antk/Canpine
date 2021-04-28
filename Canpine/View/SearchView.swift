//
//  SearchView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/12.
//

import SwiftUI
import PartialSheet

struct SearchView: View {
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @Binding var showSearch: Bool
    @State var userId = ""
    @State var paddingBottom: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text("ユーザーIDをさがす")
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 32)
                HStack {
                    TextField(userId, text: $userId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding(.leading, 32)
                    Button(action: {
                        showSearch = false
                        UIApplication.shared.endEditing()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.blue)
                            .cornerRadius(18)
                            .padding(.trailing, 20)
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                paddingBottom = 200
            }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                paddingBottom = 0
            }
            .frame(maxWidth: .infinity, maxHeight: 160)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 16)
            .padding(.bottom, paddingBottom)
            .animation(.default)
            Spacer()
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(showSearch: )
//    }
//}
