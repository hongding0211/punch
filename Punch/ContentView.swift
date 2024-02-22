//
//  ContentView.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    var onInactive: (() -> Void)?
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Punch", systemImage: "clock.fill") }
            StatisticsView()
                .tabItem { Label("Statistics", systemImage: "chart.bar.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
        .onChange(of: scenePhase, initial: false) { _, phase in
            if phase == .inactive {
                onInactive?()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(HomeModel())
}
