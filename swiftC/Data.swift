//
//  Data.swift
//  swiftC
//
//  Created by xc106d3 on 2018-03-20.
//  Copyright © 2018 xc106d3. All rights reserved.
//

import Foundation

class Data {
    static let shared = Data()
    private init() {}
    
    internal var cities = [City]()
    private var favouriteCities = [City]()

    internal func appendCity() {
    
    for i in 0..<50 {
        cities.append(City(name: "City \(i)", id: " id = \(UUID().uuidString)"))
    }
}

    internal func isFavourite(city: City) -> Bool {
    for favorite in favouriteCities {
        if favorite.id == city.id {
            return true
        }
    }
    return false
}
internal func changeFavourite(for city: City){
    let exist = isFavourite(city: city)
    if exist {
        removeCity(city: city)
        print("Remove")
    } else {
        favouriteCities.append(city)
        print("Append")
    }
}
internal func removeCity(city: City) {
        for favourite in favouriteCities {
        if favourite.id == city.id{
            if let position = favouriteCities.index(where: { $0.id == city.id}) {
                favouriteCities.remove(at: position)}
        } else {
            
        }
    }
}
}

