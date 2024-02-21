//
//  Item.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
