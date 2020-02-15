//
//  AppGroup.swift
//  SOLID principles
//
//  Created by Vokh Stag on 15/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Decodable {
    let artistName: String
    let name: String
    let id: String
}







