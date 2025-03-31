import SwiftUI

protocol Easable {
    static func ease(from: Self, to: Self, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Self
}   
