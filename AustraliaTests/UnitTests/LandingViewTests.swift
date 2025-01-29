//
//  LandingViewTests.swift
//  AustraliaTests
//

import XCTest
import SwiftUI
@testable import Australia

class LandingViewTests: XCTestCase {

    // Test for ensuring data is loaded properly in the view model
    func testViewModelDataLoading() {
        let viewModel = CityListViewModel()
        let expectation = self.expectation(description: "Load data")
        
        viewModel.loadData() // Assuming this function loads data asynchronously
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(viewModel.groupedCities.isEmpty, "Grouped cities should not be empty after data is loaded.")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }

    // Test for checking section expansion behavior
    func testToggleSection() {
        let landingView = LandingView()

        // Initial state: no expanded section
        XCTAssertNil(landingView.currentExpandedState)

        // Toggle section
        landingView.toggleSection(state: "New South Wales")
        XCTAssertEqual(landingView.currentExpandedState, "New South Wales")

        // Toggle again to collapse
        landingView.toggleSection(state: "New South Wales")
        XCTAssertNil(landingView.currentExpandedState)
    }
}
