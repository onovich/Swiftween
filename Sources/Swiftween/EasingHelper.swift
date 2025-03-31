import Foundation
import CoreGraphics
import SwiftUI

public struct EasingHelper {
    
    public typealias EasingHandler = (Float, Float, Float, Float, EasingMode) -> Float
    
    public static func easingCGColor(start: CGColor, end: CGColor, current: Float, duration: Float, type: EasingType, mode: EasingMode = .none) -> CGColor {
        guard let s = start.components, let e = end.components else { return start }
        let r = easing(start: Float(s[0]), end: Float(e[0]), current: current, duration: duration, type: type, mode: mode)
        let g = easing(start: Float(s[1]), end: Float(e[1]), current: current, duration: duration, type: type, mode: mode)
        let b = easing(start: Float(s[2]), end: Float(e[2]), current: current, duration: duration, type: type, mode: mode)
        let a = easing(start: Float(s[3]), end: Float(e[3]), current: current, duration: duration, type: type, mode: mode)
        return CGColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }
    
    public static func easing2D(start: CGPoint, end: CGPoint, current: Float, duration: Float, type: EasingType, mode: EasingMode = .none) -> CGPoint {
        let x = easing(start: Float(start.x), end: Float(end.x), current: current, duration: duration, type: type, mode: mode)
        let y = easing(start: Float(start.y), end: Float(end.y), current: current, duration: duration, type: type, mode: mode)
        return CGPoint(x: CGFloat(x), y: CGFloat(y))
    }
    
    public static func easing(start: Float, end: Float, current: Float, duration: Float, type: EasingType, mode: EasingMode = .none) -> Float {
        let handler = getEasingFunction(type: type)
        let c = end - start
        return handler(current, start, c, duration, mode)
    }
    
    private static func getEasingFunction(type: EasingType) -> EasingHandler {
        switch type {
            case .linear: return EasingFunction.linear
            case .sine: return EasingFunction.sine
            case .quad: return EasingFunction.quad
            case .quint: return EasingFunction.quint
            case .expo: return EasingFunction.expo
            case .circ: return EasingFunction.circ
            case .back: return EasingFunction.back
            case .elastic: return EasingFunction.elastic
            case .bounce: return EasingFunction.bounce
            default: return EasingFunction.linear
        }
    }
}
