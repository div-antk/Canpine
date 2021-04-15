//
//  UIApplication+extension.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/04/16.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil
        )
    }
}
