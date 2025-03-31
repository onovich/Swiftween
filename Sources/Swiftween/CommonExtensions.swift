import SwiftUI

public extension View {
     func swiftween<T: Easable>(binding: Binding<T>, from: T, to target: T, duration: TimeInterval, easeType: EasingType, easeMode: EasingMode = .none) -> some View {
        let animator = Swiftween(from: from, to: target, duration: duration, easeType: easeType, easeMode: easeMode)
        animator.startAnimation()

         return self.onReceive(animator.$currentValue) { newValue in
            binding.wrappedValue = newValue
        }
    }
}

import SwiftUI

extension CGColor: Easable {
     public  static func ease(from: CGColor, to: CGColor, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Self {
        guard let fromComponents = from.components, let toComponents = to.components else {
            return from as! Self  // 强制转换为 Self（即 CGColor）
        }
        
        let numComponents = min(fromComponents.count, toComponents.count)
        var easedComponents: [CGFloat] = []
        
        for i in 0..<numComponents {
            let easedValue = CGFloat.ease(from: fromComponents[i], to: toComponents[i], progress: progress, easeType: easeType, easeMode: easeMode)
            easedComponents.append(easedValue)
        }
        
        return Self(colorSpace: from.colorSpace ?? CGColorSpaceCreateDeviceRGB(), components: easedComponents)! 
    }
}

extension CGFloat:Easable {
    public static func ease(from: CGFloat, to: CGFloat, progress: Float, easeType: EasingType, easeMode: EasingMode) -> CGFloat {
        return from + (to - from) * CGFloat(progress)
    }
}

extension Double:Easable {
    public static func ease(from: Double, to: Double, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Double {
        return from + (to - from) * Double(progress)
    }
}
