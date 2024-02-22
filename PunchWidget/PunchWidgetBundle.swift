//
//  PunchWidgetBundle.swift
//  PunchWidget
//
//  Created by hong on 2024/2/21.
//

import WidgetKit
import SwiftUI

@main
struct PunchWidgetBundle: WidgetBundle {
    var body: some Widget {
        PunchWidget()
        PunchWidgetLiveActivity()
    }
}
