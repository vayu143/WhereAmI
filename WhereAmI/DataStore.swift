//
//  DataStore.swift
//  WhereAmI
//
//  Created by Vayunandan reddy Kunduru on 10/17/18.
//  Copyright © 2018 Vayunandan reddy Kunduru. All rights reserved.
//

import Foundation

struct StorageKeys {
    
    static let storedLat = "storedLat"
    static let storedLongi = "storedLongi"
}

class DataStore{
    func GetDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    func StoreDataPoint(latitude: String, longitude: String) {
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLongi)
        
        def.synchronize()
        print(latitude + "  " + longitude)
    }
    
    func GetlastLocation() -> VisitedPoint? {
        let defaults = GetDefaults()
        
        if let lat = defaults.string(forKey: StorageKeys.storedLat) {
            if let long = defaults.string(forKey: StorageKeys.storedLongi) {
                return VisitedPoint(lat : lat, longi: long)
            }
        }
        return nil
    }
}
