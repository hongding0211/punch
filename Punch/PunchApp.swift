//
//  PunchApp.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI

@main
struct PunchApp: App {
    @State private var homeModel = HomeModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(onInactive: {
                Task {
                    do {
                        try await homeModel.save()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            })
                .environment(homeModel)
                .task {
                    do {
                        try await homeModel.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
