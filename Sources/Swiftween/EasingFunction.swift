import Foundation

public struct EasingFunction {
    
    public static func linear(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        return c * t / d + b
    }
    
    public static func sine(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return sineIn(t: t, b: b, c: c, d: d)
        case .easeOut: return sineOut(t: t, b: b, c: c, d: d)
        default: return sineInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func quad(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return quadIn(t: t, b: b, c: c, d: d)
        case .easeOut: return quadOut(t: t, b: b, c: c, d: d)
        default: return quadInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func cubic(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return cubicIn(t: t, b: b, c: c, d: d)
        case .easeOut: return cubicOut(t: t, b: b, c: c, d: d)
        default: return cubicInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func quart(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return quartIn(t: t, b: b, c: c, d: d)
        case .easeOut: return quartOut(t: t, b: b, c: c, d: d)
        default: return quartInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func quint(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return quintIn(t: t, b: b, c: c, d: d)
        case .easeOut: return quintOut(t: t, b: b, c: c, d: d)
        default: return quintInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func expo(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return expoIn(t: t, b: b, c: c, d: d)
        case .easeOut: return expoOut(t: t, b: b, c: c, d: d)
        default: return expoInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func circ(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return circIn(t: t, b: b, c: c, d: d)
        case .easeOut: return circOut(t: t, b: b, c: c, d: d)
        default: return circInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func back(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return backIn(t: t, b: b, c: c, d: d)
        case .easeOut: return backOut(t: t, b: b, c: c, d: d)
        default: return backInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func elastic(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return elasticIn(t: t, b: b, c: c, d: d)
        case .easeOut: return elasticOut(t: t, b: b, c: c, d: d)
        default: return elasticInOut(t: t, b: b, c: c, d: d)
        }
    }
    
    public static func bounce(t: Float, b: Float, c: Float, d: Float, mode: EasingMode) -> Float {
        switch mode {
        case .easeIn: return bounceIn(t: t, b: b, c: c, d: d)
        case .easeOut: return bounceOut(t: t, b: b, c: c, d: d)
        default: return bounceInOut(t: t, b: b, c: c, d: d)
        }
    }
        
    // Sine
    private static func sineIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        return -c * cos(t / d * (Float.pi / 2)) + c + b
    }
    
    private static func sineOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        return c * sin(t / d * (Float.pi / 2)) + b
    }
    
    private static func sineInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        return -c / 2 * (cos(Float.pi * t / d) - 1) + b
    }
    
    // Quad
    private static func quadIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return c * tNormalized * tNormalized + b
    }
    
    private static func quadOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return -c * tNormalized * (tNormalized - 2) + b
    }
    
    private static func quadInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return c / 2 * tNormalized * tNormalized + b
        }
        tNormalized -= 1
        return -c / 2 * (tNormalized * (tNormalized - 2) - 1) + b
    }
    
    // Cubic
    private static func cubicIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return c * tNormalized * tNormalized * tNormalized + b
    }
    
    private static func cubicOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d - 1
        return c * (tNormalized * tNormalized * tNormalized + 1) + b
    }
    
    private static func cubicInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return c / 2 * tNormalized * tNormalized * tNormalized + b
        }
        tNormalized -= 2
        return c / 2 * (tNormalized * tNormalized * tNormalized + 2) + b
    }
    
    // Quart
    private static func quartIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return c * tNormalized * tNormalized * tNormalized * tNormalized + b
    }
    
    private static func quartOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d - 1
        return -c * (tNormalized * tNormalized * tNormalized * tNormalized - 1) + b
    }
    
    private static func quartInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return c / 2 * tNormalized * tNormalized * tNormalized * tNormalized + b
        }
        tNormalized -= 2
        return -c / 2 * (tNormalized * tNormalized * tNormalized * tNormalized - 2) + b
    }
    
    // Quint
    private static func quintIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return c * tNormalized * tNormalized * tNormalized * tNormalized * tNormalized + b
    }
    
    private static func quintOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d - 1
        return c * (tNormalized * tNormalized * tNormalized * tNormalized * tNormalized + 1) + b
    }
    
    private static func quintInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return c / 2 * tNormalized * tNormalized * tNormalized * tNormalized * tNormalized + b
        }
        tNormalized -= 2
        return c / 2 * (tNormalized * tNormalized * tNormalized * tNormalized * tNormalized + 2) + b
    }
    
    // Expo
    private static func expoIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        return t == 0 ? b : c * pow(2, 10 * (t / d - 1)) + b
    }
    
    private static func expoOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        return t == d ? b + c : c * (-pow(2, -10 * t / d) + 1) + b
    }
    
    private static func expoInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        if t == 0 { return b }
        if t == d { return b + c }
        
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return c / 2 * pow(2, 10 * (tNormalized - 1)) + b
        }
        tNormalized -= 1
        return c / 2 * (-pow(2, -10 * tNormalized) + 2) + b
    }
    
    // Circ
    private static func circIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        return -c * (sqrt(1 - tNormalized * tNormalized) - 1) + b
    }
    
    private static func circOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d - 1
        return c * sqrt(1 - tNormalized * tNormalized) + b
    }
    
    private static func circInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            return -c / 2 * (sqrt(1 - tNormalized * tNormalized) - 1) + b
        }
        tNormalized -= 2
        return c / 2 * (sqrt(1 - tNormalized * tNormalized) + 1) + b
    }
    
    // Back
    private static func backIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        let s: Float = 1.70158
        let tNormalized = t / d
        return c * tNormalized * tNormalized * ((s + 1) * tNormalized - s) + b
    }
    
    private static func backOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let s: Float = 1.70158
        let tNormalized = t / d - 1
        return c * (tNormalized * tNormalized * ((s + 1) * tNormalized + s) + 1) + b
    }
    
    private static func backInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        var s: Float = 1.70158
        var tNormalized = t / (d / 2)
        if tNormalized < 1 {
            s *= 1.525
            return c / 2 * (tNormalized * tNormalized * ((s + 1) * tNormalized - s)) + b
        }
        tNormalized -= 2
        s *= 1.525
        return c / 2 * (tNormalized * tNormalized * ((s + 1) * tNormalized + s) + 2) + b
    }
    
    // Elastic
    private static func elasticIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        if t == 0 { return b }
        let tNormalized = t / d
        if tNormalized == 1 { return b + c }
        
        let p = d * 0.3
        let a = c
        let s = p / 4
        
        let modifiedT = tNormalized - 1
        return -(a * pow(2, 10 * modifiedT) * sin((modifiedT * d - s) * (2 * Float.pi) / p)) + b
    }
    
    private static func elasticOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        if t == 0 { return b }
        let tNormalized = t / d
        if tNormalized == 1 { return b + c }
        
        let p = d * 0.3
        let a = c
        let s = p / 4
        
        return a * pow(2, -10 * tNormalized) * sin((tNormalized * d - s) * (2 * Float.pi) / p) + c + b
    }
    
    private static func elasticInOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        if t == 0 { return b }
        var tNormalized = t / (d / 2)
        if tNormalized == 2 { return b + c }
        
        let p = d * (0.3 * 1.5)
        let a = c
        let s = p / 4
        
        if tNormalized < 1 {
            tNormalized -= 1
            return -0.5 * (a * pow(2, 10 * tNormalized) * sin((tNormalized * d - s) * (2 * Float.pi) / p)) + b
        }
        tNormalized -= 1
        return a * pow(2, -10 * tNormalized) * sin((tNormalized * d - s) * (2 * Float.pi) / p) * 0.5 + c + b
    }
    
    // Bounce
    private static func bounceIn(t: Float, b: Float, c: Float, d: Float) -> Float {
        return c - bounceOut(t: d - t, b: 0, c: c, d: d) + b
    }
    
    private static func bounceOut(t: Float, b: Float, c: Float, d: Float) -> Float {
        let tNormalized = t / d
        if tNormalized < 1 / 2.75 {
            return c * 7.5625 * tNormalized * tNormalized + b
        } else if tNormalized < 2 / 2.75 {
            let tAdjusted = tNormalized - 1.5 / 2.75
            return c * (7.5625 * tAdjusted * tAdjusted + 0.75) + b
        } else if tNormalized < 2.5 / 2.75 {
            let tAdjusted = tNormalized - 2.25 / 2.75
            return c * (7.5625 * tAdjusted * tAdjusted + 0.9375) + b
        } else {
            let tAdjusted = tNormalized - 2.625 / 2.75
            return c * (7.5625 * tAdjusted * tAdjusted + 0.984375) + b
        }
    }
    
    private static func bounceInOut(t: Float, b: Float, c: Float, d: Float) -> Float{
        if t < d / 2 {
            return bounceIn(t: t * 2, b: 0, c: c, d: d) * 0.5 + b;
        } else {
            return bounceOut(t: t * 2 - d, b: 0, c: c, d: d) * 0.5 + c * 0.5 + b;
        }
    }
}
