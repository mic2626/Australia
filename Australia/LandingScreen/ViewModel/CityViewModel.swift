//
//  CityViewModel.swift
//  Australia
//
import Foundation
import SwiftUI

// MARK: - ViewModel
class CityListViewModel: ObservableObject {
    @Published var expandedState: String? = nil
    @Published var groupedCities: [String: [City]] = [:]
    private var isReversedForState: [String: Bool] = [:] // Tracks reverse state for each section
    private let dataCache: DataCache

    /// Dependency injection through initializer
    init(dataCache: DataCache = DefaultDataCache()) {
        self.dataCache = dataCache
        loadData()
    }

    func loadData() {
        if let cachedData = dataCache.getCachedData() {
            parseAndGroup(cities: cachedData)
        } else {
            fetchDataFromFile()
        }
    }

    func fetchDataFromFile() {
        // Read file name from Info.plist
        guard let fileName = ConfigManager.getFileName(forKey: Localization.ViewModel.fileName),
              let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print(Localization.ViewModel.missingFile)
            return
        }

        do {
            let cities = try JSONDecoder().decode([City].self, from: data)
            dataCache.cacheData(cities: cities)
            parseAndGroup(cities: cities)
        } catch {
            print("Decoding error: \(error)")
        }
    }

    func parseAndGroup(cities: [City]) {
        groupedCities = Dictionary(grouping: cities, by: { $0.adminName }).mapValues { $0.sorted { $0.city < $1.city } }
        isReversedForState = groupedCities.keys.reduce(into: [:]) { $0[$1] = false } // Initialize reverse state
    }

    func toggleReverse(for state: String) {
        guard var cities = groupedCities[state] else { return }
        isReversedForState[state]?.toggle() // Toggle reverse state
        cities.reverse() // Reverse the list
        groupedCities[state] = cities
    }
}
