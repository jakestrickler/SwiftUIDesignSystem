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
    
    @Test func content() async throws {
        let title = Button("Title") {}
            .buttonStyle(.borderedProminent)
        
        let titleSymbol = Button("Title", systemImage: "questionmark.square.dashed") {}
            .buttonStyle(.borderedProminent)
        
        let symbol = Button("Title", systemImage: "questionmark.square.dashed") {}
            .buttonStyle(.borderedProminent)
            .labelStyle(.iconOnly)
        
        try await generator.generateScreenshots(of: title, fileName: "title")
        try await generator.generateScreenshots(of: titleSymbol, fileName: "titleSymbol")
        try await generator.generateScreenshots(of: symbol, fileName: "symbol")
    }
    
    @Test func sizes() async throws {
        let base = Button("Title") {}
            .buttonStyle(.borderedProminent)
        
        try await generator.generateScreenshots(of: base.controlSize(.small), fileName: "small")
        try await generator.generateScreenshots(of: base.controlSize(.regular), fileName: "regular")
        try await generator.generateScreenshots(of: base.controlSize(.large), fileName: "large")
        try await generator.generateScreenshots(of: base.buttonSizing(.flexible), fileName: "fullWidth")
    }
    
    @Test func borderShapes() async throws {
        let base = Button("Title") {}
            .buttonStyle(.borderedProminent)

        try await generator.generateScreenshots(of: base.buttonBorderShape(.capsule), fileName: "capsule")
        try await generator.generateScreenshots(of: base.buttonBorderShape(.roundedRectangle), fileName: "roundedRect")
        try await generator.generateScreenshots(of: base.buttonBorderShape(.roundedRectangle(radius: 12)), fileName: "roundedRectRadius")
        
        let circle = Button("Title", systemImage: "questionmark.square.dashed") {}
            .buttonStyle(.borderedProminent)
            .labelStyle(.iconOnly)
            .buttonBorderShape(.circle)
        
        try await generator.generateScreenshots(of: circle, fileName: "circle")
    }
    
    @Test func tint() async throws {
        let button = Button("Title") {}
            .buttonStyle(.borderedProminent)
            .tint(.green)
        try await generator.generateScreenshots(of: button, fileName: "tint")
    }
    
    @Test func roles() async throws {
        let button = Button("Delete", role: .destructive) {}
            .buttonStyle(.borderedProminent)
        try await generator.generateScreenshots(of: button, fileName: "destructive")
    }
    
    @Test func modifiedStyle() async throws {
        struct PrimaryButtonStyle: PrimitiveButtonStyle {
            func makeBody(configuration: Configuration) -> some View {
                Button(configuration)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .bold()
            }
        }
        
        let button = Button("Title", systemImage: "questionmark.square.dashed") {}
            .buttonStyle(PrimaryButtonStyle())
        try await generator.generateScreenshots(of: button, fileName: "modifiedStyle")
    }
}
