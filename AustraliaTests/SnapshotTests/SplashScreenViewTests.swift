//
//  SplashScreenViewTests.swift
//  AustraliaTests
//

import XCTest
import SwiftUI
import SnapshotTesting

@testable import Australia

final class SplashScreenViewTests: XCTestCase {

    func testSplashScreenViewInLightMode() {
            // Given
            let view = SplashScreenView()
                .environment(\.colorScheme, .light)
            let hostingController = UIHostingController(rootView: view)

            // When
            hostingController.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844) // iPhone 15 size

            // Then
        assertSnapshot(of: hostingController, as: .image, named: "LightMode_iPhone15", record: false)
        }

        func testSplashScreenViewInDarkMode() {
            // Given
            let view = SplashScreenView()
                .environment(\.colorScheme, .dark)
            let hostingController = UIHostingController(rootView: view)

            // When
            hostingController.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844) // iPhone 15 size

            // Then
            assertSnapshot(of: hostingController, as: .image, named: "DarkMode_iPhone15", record: false)
        }
}
