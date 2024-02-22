//
//  PunchWidgetLiveActivity.swift
//  PunchWidget
//
//  Created by hong on 2024/2/21.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PunchWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PunchWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PunchWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PunchWidgetAttributes {
    fileprivate static var preview: PunchWidgetAttributes {
        PunchWidgetAttributes(name: "World")
    }
}

extension PunchWidgetAttributes.ContentState {
    fileprivate static var smiley: PunchWidgetAttributes.ContentState {
        PunchWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PunchWidgetAttributes.ContentState {
         PunchWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PunchWidgetAttributes.preview) {
   PunchWidgetLiveActivity()
} contentStates: {
    PunchWidgetAttributes.ContentState.smiley
    PunchWidgetAttributes.ContentState.starEyes
}
