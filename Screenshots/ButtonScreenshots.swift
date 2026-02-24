//
//  ButtonScreenshots.swift
//  Screenshots
//
//  Created by Jake on 2/23/26.
//

import SwiftUI
import Testing

@MainActor
struct ButtonScreenshots {
    let generator = ScreenshotGenerator(baseDirectory: "Button")

    @Test func styles() async throws {
        let base = Button("Title") {}

        let borderedProminent = base.buttonStyle(.borderedProminent)
        let bordered = base.buttonStyle(.bordered).tint(.gray)
        let borderedTinted = base.buttonStyle(.bordered).tint(.blue)
        let borderless = base.buttonStyle(.borderless)
        let glass = base.buttonStyle(.glass)
        let glassProminent = base.buttonStyle(.glassProminent)
        let plain = base.buttonStyle(.plain)

        try await generator.generateScreenshots(of: borderedProminent, fileName: "borderedProminent")
        try await generator.generateScreenshots(of: bordered, fileName: "bordered")
        try await generator.generateScreenshots(of: borderedTinted, fileName: "borderedTinted")
        try await generator.generateScreenshots(of: borderless, fileName: "borderless")
        try await generator.generateScreenshots(of: glass, fileName: "glass")
        try await generator.generateScreenshots(of: glassProminent, fileName: "glassProminent")
        try await generator.generateScreenshots(of: plain, fileName: "plain")
    }
    
    @Test func content() throws {
        
    }
}
