//
//  AutoIdentifiable.swift
//  Apple Design System
//
//  Created by Jake on 1/17/26.
//

import Foundation

protocol AutoIdentifiable: Identifiable {}

extension AutoIdentifiable {
    var id: Self { self }
}
