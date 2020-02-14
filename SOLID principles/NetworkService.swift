//
//  NetworkService.swift
//  SOLID principles
//
//  Created by Vokh Stag on 14/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation

struct NetworkService {
    
    func dataFetcher(urlString: String) {
        request (urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            print(response)
        }
    }
    
    private func request(urlString: String, complition: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
               complition(data, error)
            }
        }
        task.resume()
    }
}
