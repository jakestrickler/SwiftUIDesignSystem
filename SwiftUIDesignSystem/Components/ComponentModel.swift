//
//  ComponentModel.swift
//  Apple Design System
//
//  Created by Jake on 1/17/26.
//

import Foundation

@Observable
class ComponentModel {
    enum Component: String, AutoIdentifiable {
        case button
        
        var name: String { rawValue.capitalized }
    }
    
    let components: [Component] = [.button]
}
