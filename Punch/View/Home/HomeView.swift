//
//  HomeView.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI
import SwiftDate

struct HomeView: View {
    private var totalTime = 10
    
    @State private var isPause = true
    
    private var totalTimeStr: String {
        totalTime.seconds.timeInterval.toString {
            $0.unitsStyle = .none
            $0.allowedUnits = [.hour, .minute, .second]
            $0.zeroFormattingBehavior = .pad
        }
    }
    
    private func handlePunch() {
        isPause.toggle()
    }
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
                    VStack(spacing: 0) {
                        Text("Today's Time")
                            .font(.headline)
                            .foregroundStyle(Color(UIColor.secondaryLabel))
                            .padding(.bottom, 4)
                        Text(totalTimeStr)
                            .font(.system(size: 64))
                            .foregroundStyle(Color(UIColor.label))
                    }
                    Spacer()
                    PunchButton(isPause: isPause, onPress: handlePunch)
                        .padding(.bottom, 12)
                }
                .padding(.top, geo.size.height / 16)
                .padding(.bottom, geo.size.height / 10)
                .navigationTitle("Punch")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        
    }
}

#Preview {
    HomeView()
}