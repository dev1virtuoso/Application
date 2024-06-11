//
//  Item.swift
//  NeuralMorse
//
//  Created by Carson Wu on 5/9/24.
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
