//
//  NetworkDataFetcher.swift
//  SOLID principles
//
//  Created by Vokh Stag on 14/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation


protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, responce: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, responce: @escaping (T?) -> Void) {
        print(T.self)
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                responce(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            responce(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON ", jsonError)
            return nil
        }
    }
    
}












