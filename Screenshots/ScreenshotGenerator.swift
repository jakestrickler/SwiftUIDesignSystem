//
//  ScreenshotGenerator.swift
//  Apple Design System
//
//  Created by Jake on 2/23/26.
//

import SwiftUI

@MainActor
struct ScreenshotGenerator {
    enum Error: Swift.Error {
        case noImageFound
        case unableToConvertToPNG
    }
    
    var baseDirectory = ""
    
    private let scales = [1.0, 2.0, 3.0]
    private let colorSchemes = [ColorScheme.light, .dark]
    private let outputDirectory: URL
    private let fileManager = FileManager.default
    
    init(baseDirectory: String = "") {
        var resourcesURL = URL(filePath: "/Users/jake/Developer/SwiftUIDesignSystem/SwiftUIDesignSystem/Documentation.docc/Resources/")
        if !baseDirectory.isEmpty {
            resourcesURL.append(path: "\(baseDirectory)/")
        }
        outputDirectory = resourcesURL
    }
    
    func generateScreenshots<Content: View>(of view: Content, fileName: String) async throws {
        try await MainActor.run {
            if !fileManager.fileExists(atPath: outputDirectory.path(percentEncoded: false)) {
                print("***", fileName)
                try fileManager.createDirectory(at: outputDirectory, withIntermediateDirectories: false)
            }
            
            for colorScheme in colorSchemes {
                let content = ComponentExampleView(component: view)
                    .colorScheme(colorScheme)
                
                let renderer = ImageRenderer(content: content)
                for scale in scales {
                    renderer.scale = scale
                    
                    guard let image = renderer.uiImage else { throw Error.noImageFound }
                    guard let pngData = image.pngData() else { throw Error.unableToConvertToPNG }
                    
                    let fullFileName = "\(outputDirectory.lastPathComponent.lowercased())-\(fileName)\(colorScheme.doccFilepathSuffix)@\(Int(scale))x.png"
                    let outputURL = outputDirectory.appending(path: fullFileName)
                    try pngData.write(to: outputURL)
                }
            }
        }
    }
}

extension ColorScheme {
    var doccFilepathSuffix: String {
        switch self {
        case .light: ""
        case .dark: "~dark"
        @unknown default: fatalError("Unknown color scheme.")
        }
    }
}

struct ComponentExampleView<Component: View>: View {
    let component: Component
    
    var body: some View {
        component
            .frame(width: 218, height: 100)
            .padding(.horizontal, 16)
            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 2)
            }
            .padding()
    }
}
