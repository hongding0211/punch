//
//  ContentView.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Punch", systemImage: "clock.fill") }
            
            Text("Statistics")
                .tabItem { Label("Statistics", systemImage: "chart.bar.fill") }
            
            Text("Settings")
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
    }
}

#Preview {
    ContentView()
}
