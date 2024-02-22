//
//  ContentView.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Punch", systemImage: "clock.fill") }
            StatisticsView()
                .tabItem { Label("Statistics", systemImage: "chart.bar.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
    }
}

#Preview {
    ContentView()
}
