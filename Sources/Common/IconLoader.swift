//
//  ButtonIconName.swift
//  SnackTrackr
//
//  Created by Dimitri Brukakis on 05.05.24.
//

import SwiftUI
enum IconLoader {
    case name(String)
    case system(String)
    case none

    var image: Image? {
        switch self {
        case let .name(name): Image(name)
        case let .system(name): Image(systemName: name)
        case .none: nil
        }
    }
}
