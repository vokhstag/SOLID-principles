//
//  DataStore.swift
//  SOLID principles
//
//  Created by Vokh Stag on 14/02/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import Foundation

struct DataStore {
    
    func saveNameInCache(name: String) {
        print ("Your name: \(name) is saved")
    }
    
    func getNameFromCache() -> String {
        return "some name"
    }
    
}
