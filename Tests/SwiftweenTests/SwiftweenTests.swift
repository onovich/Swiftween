import XCTest
import CoreGraphics
@testable import Swiftween

final class SwiftweenTests: XCTestCase {
    func testEasing() {
        let start: Float = 0.0
        let end: Float = 10.0
        let duration: Float = 1.0
        let current: Float = 0.5
        
        let result = EasingHelper.easing(start: start, end: end, current: current, duration: duration, type: .linear)
        XCTAssertEqual(result, 5.0, accuracy: 0.01, "Linear easing should interpolate halfway correctly.")
    }
    
    func testEasing2D() {
        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x: 10, y: 10)
        let duration: Float = 1.0
        let current: Float = 0.5
        
        let result = EasingHelper.easing2D(start: start, end: end, current: current, duration: duration, type: .linear)
        XCTAssertEqual(result.x, 5.0, accuracy: 0.01, "X coordinate should interpolate correctly.")
        XCTAssertEqual(result.y, 5.0, accuracy: 0.01, "Y coordinate should interpolate correctly.")
    }
    
    func testEasingCGColor() {
        let start = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        let end = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        let duration: Float = 1.0
        let current: Float = 0.5
        
        let result = EasingHelper.easingCGColor(start: start, end: end, current: current, duration: duration, type: .linear)
        let components = result.components ?? []
        XCTAssertEqual(components[0], 0.5, accuracy: 0.01, "Red should interpolate correctly.")
        XCTAssertEqual(components[1], 0.5, accuracy: 0.01, "Green should interpolate correctly.")
        XCTAssertEqual(components[2], 0.5, accuracy: 0.01, "Blue should interpolate correctly.")
        XCTAssertEqual(components[3], 1.0, accuracy: 0.01, "Alpha should remain the same.")
    }
}
