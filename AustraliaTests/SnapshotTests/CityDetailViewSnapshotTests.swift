//
//  CityDetailViewSnapshotTests.swift
//  AustraliaTests
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Australia

final class CityDetailViewSnapshotTests: XCTestCase {

    func testCityDetailView() {
        // Given
        let city = City(
            city: "Sydney",
            adminName: "New South Wales",
            population: "4840600",
            lat: "-33.8678",
            lng: "151.2100",
            country: "Australia",
            iso2: "AU",
            capital: "admin",
            populationProper: "4840600"
        )
        
        let cityDetailView = CityDetailView(city: city)
        
        // When: Create a hosting controller to render the view
        let hostingController = UIHostingController(rootView: cityDetailView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844) // iPhone 15 size
        
        // Then: Capture the snapshot of the view
        assertSnapshot(of: hostingController, as: .image, named: "CityDetailView_Sydney", record: false)
    }
}
