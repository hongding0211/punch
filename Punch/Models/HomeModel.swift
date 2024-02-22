//
//  HomeModel.swift
//  Punch
//
//  Created by hong on 2024/2/22.
//

import Foundation

@Observable
class HomeModel {
    var isPause = true
    var totalTime: Int = 0
    
    private weak var timer: Timer?
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var startDate: Date?
    private var aggregateTime: Int = 0
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            self?.update()
        }
        timer?.tolerance = 0.1
        startDate = Date()
        isPause = false
    }
    
    func stop() {
        aggregateTime = totalTime
        timer?.invalidate()
        isPause = true
    }
    
    nonisolated private func update() {
        Task { @MainActor in
            guard let startDate,
                  !isPause else { return }
            totalTime = aggregateTime + Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
        }
    }
    
    static func resetIfNeed() {
        
    }
}
