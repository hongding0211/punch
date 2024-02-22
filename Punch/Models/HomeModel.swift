//
//  HomeModel.swift
//  Punch
//
//  Created by hong on 2024/2/22.
//

import Foundation

@Observable
class HomeModel {
    struct HomeData: Codable {
        var isPause = true
        var totalTime: Int = 0
    }
    
    var data = HomeData()
    
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
        data.isPause = false
    }
    
    func stop() {
        aggregateTime = data.totalTime
        timer?.invalidate()
        data.isPause = true
    }
    
    nonisolated private func update() {
        Task { @MainActor in
            guard let startDate,
                  !data.isPause else { return }
            data.totalTime = aggregateTime + Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
        }
    }
    
    private static func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            .appendingPathComponent("scrums.data")
        }
    
    func load() async throws {
            let task = Task<HomeData, Error> {
                let fileURL = try Self.fileURL()
                guard let data = try? Data(contentsOf: fileURL) else {
                    return HomeData()
                }
                let homeData = try JSONDecoder().decode(HomeData.self, from: data)
                return homeData
            }
            self.data = try await task.value
        }
    
    func save() async throws {
            let task = Task {
                let data = try JSONEncoder().encode(data)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }
}
