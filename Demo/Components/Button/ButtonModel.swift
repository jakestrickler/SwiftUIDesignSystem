//
//  ButtonModel.swift
//  Apple Design System
//
//  Created by Jake on 1/17/26.
//

import SwiftUI

@Observable
class ButtonModel {
    enum Style: String, AutoIdentifiable, CaseIterable {
        case automatic = "Automatic"
        case borderedProminent = "Bordered Prominent"
        case bordered = "Bordered"
        case borderedGray = "Bordered Gray"
        case borderless = "Borderless"
        case glassProminent = "Glass Prominent"
        case glass = "Glass"
        case plain = "Plain"
        
        var tintable: Bool {
            switch self {
            case .automatic, .borderedProminent, .bordered, .glassProminent, .borderless:
                return true
            case .borderedGray, .glass, .plain:
                return false
            }
        }
        
        var endOfSection: Bool {
            switch self {
            case .automatic, .borderless, .glass: return true
            default: return false
            }
        }
    }
    
    enum Content: String, AutoIdentifiable, CaseIterable {
        case title = "Title"
        case titleSymbol = "Title & Symbol"
        case symbol = "Symbol"
    }
    
    enum BorderShape: String, AutoIdentifiable, CaseIterable {
        case automatic = "Automatic"
        case roundedRectangle = "Rounded Rectangle"
        case capsule = "Capsule"
        case circle = "Circle"
    }
    
    enum Role: String, AutoIdentifiable, CaseIterable {
        case none = "Default"
        case destructive = "Destructive"
        case close = "Close"
        case confirm = "Confirm"
        case cancel = "Cancel"
        
        var buttonRole: ButtonRole? {
            switch self {
            case .none: return nil
            case .destructive: return .destructive
            case .close: return .close
            case .confirm: return .confirm
            case .cancel: return .cancel
            }
        }
    }
    
    var style: Style = .borderedProminent
    var tint: Color = .accentColor
    var role: Role = .none
    var content: Content = .title
    var controlSize: ControlSize = .regular
    var shape: BorderShape = .automatic
    var buttonSize: ButtonSizing = .automatic
    
    var tintable: Bool {
        style.tintable && role == .none
    }
}
