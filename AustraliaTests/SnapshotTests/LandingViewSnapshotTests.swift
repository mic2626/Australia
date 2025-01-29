//
//  LandingViewSnapshotTests.swift
//  AustraliaTests
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Australia

final class LandingViewSnapshotTests: XCTestCase {

    // Test snapshot with splash screen visible
    func testLandingViewWithSplashScreen() {
        // Given
        let landingView = LandingView()
        
        // Simulate splash screen being shown
        landingView.showSplashScreen = true
        
        // Create a hosting controller with the view
        let hostingController = UIHostingController(rootView: landingView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844) // iPhone 15 size
        
        // When & Then
        assertSnapshot(of: hostingController, as: .image, named: "LandingView_WithSplashScreen", record: false)
    }
    
    // Test snapshot with splash screen hidden
    func testLandingViewWithoutSplashScreen() {
        // Given
        let landingView = LandingView()
        
        // Simulate splash screen being dismissed
        landingView.showSplashScreen = false
        
        // Create a hosting controller with the view
        let hostingController = UIHostingController(rootView: landingView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844) // iPhone 15 size
        
        // When & Then
        assertSnapshot(of: hostingController, as: .image, named: "LandingView_WithoutSplashScreen", record: false)
    }
}
