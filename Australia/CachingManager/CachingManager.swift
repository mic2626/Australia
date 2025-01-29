//
//  CachingManager.swift
//  Australia
//

import Foundation

// MARK: - Cache
protocol DataCache {
    func getCachedData() -> [City]?
    func cacheData(cities: [City])
}

class DefaultDataCache: DataCache {
    private var cachedCities: [City]? = nil

    func getCachedData() -> [City]? {
        cachedCities
    }

    func cacheData(cities: [City]) {
        cachedCities = cities
    }
}
