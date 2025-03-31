import SwiftUI

extension View {
    public func swiftween<T: Easable>(binding: Binding<T>, from: T, to target: T, duration: TimeInterval, easeType: EasingType, easeMode: EasingMode = .none) -> some View {
        let animator = Swiftween(from: from, to: target, duration: duration, easeType: easeType, easeMode: easeMode)
        animator.startAnimation()

        return self.onReceive(animator.$animatedValue) { newValue in
            binding.wrappedValue = newValue
        }
    }
}

extension Color: Easable {
    static func ease(from: Color, to: Color, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Color {
        let start = from.cgColor.components ?? [0, 0, 0, 1]
        let end = to.cgColor.components ?? [0, 0, 0, 1]
        
        // 根据 progress 计算插值
        let r = CGFloat(start[0] + (end[0] - start[0]) * CGFloat(progress))
        let g = CGFloat(start[1] + (end[1] - start[1]) * CGFloat(progress))
        let b = CGFloat(start[2] + (end[2] - start[2]) * CGFloat(progress))
        let a = CGFloat(start[3] + (end[3] - start[3]) * CGFloat(progress))

        return Color(red: r, green: g, blue: b, opacity: a)
    }
}

extension CGFloat: Easable {
    static func ease(from: CGFloat, to: CGFloat, progress: Float, easeType: EasingType, easeMode: EasingMode) -> CGFloat {
        // 基本的线性插值
        return from + (to - from) * CGFloat(progress)
    }
}

extension Double: Easable {
    static func ease(from: Double, to: Double, progress: Float, easeType: EasingType, easeMode: EasingMode) -> Double {
        // 基本的线性插值
        return from + (to - from) * Double(progress)
    }
}


