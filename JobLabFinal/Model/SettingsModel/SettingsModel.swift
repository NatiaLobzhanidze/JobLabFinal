//
//  File.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 20.09.22.
//

import Foundation
import UIKit

struct SettingsModel {
    let image: String
    let titleLb: String
}
struct SettingsValue {
    let value: String
}

enum SettingsConfigure {
    static let settingsTitle = ["Help & Support", "About",   "Log Out"]
    static var settingsIcons  = ["questionmark.circle.fill", "info.circle.fill", "rectangle.portrait.and.arrow.right.fill"]
}
