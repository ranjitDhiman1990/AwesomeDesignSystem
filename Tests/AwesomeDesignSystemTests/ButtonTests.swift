//
//  Untitled.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import XCTest
import SwiftUI
@testable import AwesomeDesignSystem

class AwesomeButtonTests: XCTestCase {
    @MainActor func testButtonInitialization() {
        let button = AwesomeButton(title: "Test Button", action: {})
        
        XCTAssertEqual(button.title, "Test Button")
        XCTAssertNil(button.icon)
        XCTAssertEqual(button.size, .medium)
        XCTAssertEqual(button.style, .primary)
        XCTAssertTrue(button.isFullWidth)
        XCTAssertFalse(button.isLoading)
    }
    
    @MainActor func testInitializationWithAllParameters() {
        let testIcon = Image(systemName: "heart")
        let button = AwesomeButton(
            title: "Test",
            icon: testIcon,
            size: .large,
            style: .danger,
            isFullWidth: false,
            isLoading: true,
            action: {}
        )
        
        XCTAssertEqual(button.title, "Test")
        XCTAssertNotNil(button.icon)
        XCTAssertEqual(button.size, .large)
        XCTAssertEqual(button.style, .danger)
        XCTAssertFalse(button.isFullWidth)
        XCTAssertTrue(button.isLoading)
    }
}
