//
//  SettingsOption.swift
//  iOS3-HW12-Fedyshin Matvey
//
//  Created by matt_spb on 08.01.2022.
//

import UIKit

struct Section {
    let options: [SettingsOption]
}

struct SettingsOption {
    let cellType: SettingsOptionsType
    let title: String
    let iconName: String
    let backgroundColor: UIColor
    var detailInfo: String?
    var isOn: Bool?

    enum SettingsOptionsType {
        case regularCell
        case switchCell
        case detailCell
    }
}
