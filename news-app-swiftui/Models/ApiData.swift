//
//  ApiData.swift
//  news-app-swiftui
//
//  Created by Илья Дернов on 11.11.2020.
//

import Foundation

struct ApiData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
