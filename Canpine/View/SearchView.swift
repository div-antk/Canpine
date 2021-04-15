//
//  SearchView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/12.
//

import SwiftUI
import ExytePopupView
import KeyboardObserving

struct SearchView: View {
    
    @Binding var showSearch: Bool
    @State var userId = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Spacer()
                Button(action: {
                    // キーボードを閉じる
                    UIApplication.shared.endEditing()
                    showSearch = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(
                            top: 20, leading: 0, bottom: 12, trailing: 20
                        ))                }
            }
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
            Spacer(minLength: 40)
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 32)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .keyboardObserving()

    }
    
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(showSearch: )
//    }
//}
