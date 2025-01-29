//
//  CityListViewModelTests.swift
//  AustraliaTests
//

import XCTest
@testable import Australia

class MockDataCache: DataCache {
    private var mockCities: [City]?

    func getCachedData() -> [City]? {
        return mockCities
    }

    func cacheData(cities: [City]) {
        mockCities = cities
    }
}

final class CityListViewModelTests: XCTestCase {
    var viewModel: CityListViewModel!
    var mockDataCache: MockDataCache!

    override func setUp() {
        super.setUp()
        mockDataCache = MockDataCache()
        viewModel = CityListViewModel(dataCache: mockDataCache)
    }

    func testLoadDataFromCache() {
        // Arrange
        let mockCities = [
            City(city: "Sydney", adminName: "New South Wales", population: "5000000", lat: "-33.8688", lng: "151.2093", country: "Australia", iso2: "AU", capital: "admin", populationProper: "5000000"),
            City(city: "Melbourne", adminName: "Victoria", population: "4000000", lat: "-37.8136", lng: "144.9631", country: "Australia", iso2: "AU", capital: "admin", populationProper: "4000000")
        ]
        mockDataCache.cacheData(cities: mockCities)

        // Act
        viewModel.loadData()

        // Assert
        XCTAssertEqual(viewModel.groupedCities.count, 2)
        XCTAssertEqual(viewModel.groupedCities["New South Wales"]?.count, 1)
    }

    func testFetchDataFromFile() {
        // Simulate the behavior of fetching data from a file
        let mockJSON = """
        [
            { "city": "Sydney", "admin_name": "New South Wales", "population": "5000000", "lat": "-33.8688", "lng": "151.2093", "country": "Australia", "iso2": "AU", "capital": "admin", "population_proper": "5000000" },
            { "city": "Melbourne", "admin_name": "Victoria", "population": "4000000", "lat": "-37.8136", "lng": "144.9631", "country": "Australia", "iso2": "AU", "capital": "admin", "population_proper": "4000000" }
        ]
        """
        let mockData = Data(mockJSON.utf8)

        // Act
        do {
            let cities = try JSONDecoder().decode([City].self, from: mockData)
            viewModel.parseAndGroup(cities: cities)
        } catch {
            XCTFail("Failed to decode mock JSON: \(error)")
        }

        // Assert
        XCTAssertEqual(viewModel.groupedCities.count, 2)
        XCTAssertEqual(viewModel.groupedCities["New South Wales"]?.first?.city, "Sydney")
    }

    func testParseAndGroupCities() {
        // Arrange
        let mockCities = [
            City(city: "Sydney", adminName: "New South Wales", population: "5000000", lat: "-33.8688", lng: "151.2093", country: "Australia", iso2: "AU", capital: "admin", populationProper: "5000000"),
            City(city: "Melbourne", adminName: "Victoria", population: "4000000", lat: "-37.8136", lng: "144.9631", country: "Australia", iso2: "AU", capital: "admin", populationProper: "4000000")
        ]

        // Act
        viewModel.parseAndGroup(cities: mockCities)

        // Assert
        XCTAssertEqual(viewModel.groupedCities.count, 2)
        XCTAssertEqual(viewModel.groupedCities["New South Wales"]?.count, 1)
    }

    func testToggleReverse() {
        // Arrange
        let mockCities = [
            City(city: "Sydney", adminName: "New South Wales", population: "5000000", lat: "-33.8688", lng: "151.2093", country: "Australia", iso2: "AU", capital: "admin", populationProper: "5000000"),
            City(city: "Canberra", adminName: "New South Wales", population: "400000", lat: "-35.2809", lng: "149.1300", country: "Australia", iso2: "AU", capital: "primary", populationProper: "400000")
        ]
        viewModel.parseAndGroup(cities: mockCities)

        // Act
        viewModel.toggleReverse(for: "New South Wales")

        // Assert
        XCTAssertEqual(viewModel.groupedCities["New South Wales"]?.first?.city, "Sydney")
    }
}
