import SwiftUI

public extension View {
    func swiftween<T: Easable>(binding: Binding<T>, from: T, to target: T, duration: TimeInterval, easeType: EasingType, easeMode: EasingMode = .none) -> some View {
        let animator = Swiftween(from: from, to: target, duration: duration, easeType: easeType, easeMode: easeMode)
        animator.startAnimation()

        return self.onReceive(animator.$animatedValue) { newValue in
            binding.wrappedValue = newValue
        }
    }
}

import SwiftUI

public extension CGColor {
    static func ease(from: CGColor, to: CGColor, progress: Float, easeType: EasingType, easeMode: EasingMode) -> CGColor {
        guard let fromComponents = from.components, let toComponents = to.components else {
            return from
        }
        
        let numComponents = min(fromComponents.count, toComponents.count)
        var easedComponents: [CGFloat] = []
        
        for i in 0..<numComponents {
            let easedValue = CGFloat.ease(from: fromComponents[i], to: toComponents[i], progress: progress, easeType: easeType, easeMode: easeMode)
            easedComponents.append(easedValue)
        }
        
        return CGColor(colorSpace: from.colorSpace ?? CGColorSpaceCreateDeviceRGB(), components: easedComponents) ?? from
    }
}

public extension CGFloat {
    static func ease(from: CGFloat, to: CGFloat, progress: Float, easeType: EasingType, easeMode: EasingMode) -> CGFloat {
        return from + (to - from) * CGFloat(progress)
    }
}

public extension Double {
    static func ease(from: Double, to: Double, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Double {
        return from + (to - from) * Double(progress)
    }
}
