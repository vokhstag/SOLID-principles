//
//  NetworkService.swift
//  SOLID principles
//
//  Created by Vokh Stag on 14/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation

protocol Networking {
    func request(urlString: String, complition: @escaping(Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    
    func request(urlString: String, complition: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: complition)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping(Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
















