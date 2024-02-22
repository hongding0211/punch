//
//  HomeModel.swift
//  Punch
//
//  Created by hong on 2024/2/22.
//

import Foundation
import SwiftData

@Model
final class HomeModel {
    var isPause: Bool
    
    init(isPause: Bool) {
        self.isPause = isPause
    }
}
