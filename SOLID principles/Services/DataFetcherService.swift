//
//  DataFetcherService.swift
//  SOLID principles
//
//  Created by Vokh Stag on 15/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation


class DataFetcherService {
    
    var dataFetcher: DataFetcher!
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchNewGames(completion: @escaping(AppGroup?) -> Void ) {
       let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, responce: completion)
        }
    
    func fetchFreeGames(completion: @escaping(AppGroup?) -> Void ) {
        let urlFreeApps = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeApps, responce: completion)
        
    }
    
    func fetchCountry(completion: @escaping([Country]?) -> Void ) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJSONData(urlString: urlString, responce: completion)
        
    }
}
