//
//  UserModel.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/17.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id = UUID()
    let name: String
    let place: String
    let status: String
    let item: String
    let star: String
}
