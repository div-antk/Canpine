//
//  UserModel.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/17.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let place: String
    let status: String
    let item: String
    let star: Int
}

// インスタンスを作成
let usersData: [User] = load("usersData.json")

// JSONを読み込む
func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("error")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("error")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}




