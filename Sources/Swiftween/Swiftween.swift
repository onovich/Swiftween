import SwiftUI
import Combine

class Swiftween<T: Easable>: ObservableObject {
    @Published var currentValue: T
    private let startValue: T
    private var endValue: T
    private var duration: TimeInterval
    private var easeType: EasingType
    private var easeMode: EasingMode
    private var timer: AnyCancellable?
    private var progress: Float = 0

    init(from: T, to target: T, duration: TimeInterval, easeType: EasingType, easeMode: EasingMode) {
        self.startValue = from
        self.currentValue = from
        self.endValue = target
        self.duration = duration
        self.easeType = easeType
        self.easeMode = easeMode
    }

    func startAnimation() {
        progress = 0
        timer = Timer.publish(every: 1.0 / 60.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateAnimation()
            }
    }

    private func updateAnimation() {
        guard progress < 1.0 else {
            timer?.cancel()
            return
        }

        progress += Float(1.0 / (60.0 * duration))
        progress = min(progress, 1.0)

        // 始终以初始值为起点
        currentValue = T.ease(from: startValue, to: endValue, progress: progress, easeType: easeType, easeMode: easeMode)
    }
}
