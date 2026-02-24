//
//  ButtonDoc.swift
//  Apple Design System
//
//  Created by Jake on 1/16/26.
//

import SwiftUI

struct ButtonDoc: View {
    @State var model = ButtonModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ButtonExample()
            Divider()
            ButtonControls()
        }
        .navigationTitle("Button")
        .toolbarTitleDisplayMode(.inline)
        .environment(model)
    }
}

struct ButtonExample: View {
    @Environment(ButtonModel.self) var model
    
    var body: some View {
        Group {
            switch model.content {
            case .title:
                Button("Title", role: model.role.buttonRole) {}
            case .titleSymbol:
                Button("Title", systemImage: "questionmark.square.dashed", role: model.role.buttonRole) {}
            case .symbol:
                Button("Title", systemImage: "questionmark.square.dashed", role: model.role.buttonRole) {}
                    .labelStyle(.iconOnly)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .buttonStyle(model.style)
        .buttonBorderShape(model.shape)
        .controlSize(model.controlSize)
        .buttonSizing(model.buttonSize)
        .tint(model.tintable ? model.tint : nil)
    }
}

extension View {
    @ViewBuilder
    fileprivate func buttonStyle(_ style: ButtonModel.Style) -> some View {
        switch style {
        case .automatic:
            self.buttonStyle(DefaultButtonStyle.automatic)
        case .borderedProminent:
            self.buttonStyle(BorderedProminentButtonStyle.borderedProminent)
        case .bordered, .borderedGray:
            self.buttonStyle(BorderedButtonStyle.bordered)
        case .glassProminent:
            self.buttonStyle(GlassProminentButtonStyle.glassProminent)
        case .glass:
            self.buttonStyle(GlassButtonStyle.glass)
        case .borderless:
            self.buttonStyle(BorderlessButtonStyle.borderless)
        case .plain:
            self.buttonStyle(PlainButtonStyle.plain)
        }
    }
    
    @ViewBuilder
    fileprivate func buttonBorderShape(_ shape: ButtonModel.BorderShape) -> some View {
        switch shape {
        case .automatic:
            self.buttonBorderShape(ButtonBorderShape.automatic)
        case .roundedRectangle:
            self.buttonBorderShape(ButtonBorderShape.roundedRectangle)
        case .capsule:
            self.buttonBorderShape(ButtonBorderShape.capsule)
        case .circle:
            self.buttonBorderShape(ButtonBorderShape.circle)
        }
    }
}

struct ButtonControls: View {
    @Environment(ButtonModel.self) var model
    
    var body: some View {
        @Bindable var model = model
        
        Form {
            Picker("Content", selection: $model.content) {
                ForEach(ButtonModel.Content.allCases) { style in
                    Text(style.rawValue)
                }
            }
            
            Section {
                Picker("Style", selection: $model.style) {
                    ForEach(ButtonModel.Style.allCases) { style in
                        Text(style.rawValue)
                        if style.endOfSection { Divider() }
                    }
                }
                
                Picker("Role", selection: $model.role) {
                    ForEach(ButtonModel.Role.allCases) { role in
                        Text(role.rawValue)
                    }
                }
                
                ColorPicker("Tint", selection: $model.tint)
                    .disabled(!model.style.tintable)
                    .opacity(model.tintable ? 1 : 0.4)
            }
            
            Section {
                Picker("Border Shape", selection: $model.shape) {
                    ForEach(ButtonModel.BorderShape.allCases) { shape in
                        Text(shape.rawValue)
                    }
                }
                
                Picker("Control Size", selection: $model.controlSize) {
                    Text("Mini").tag(ControlSize.mini)
                    Text("Small").tag(ControlSize.small)
                    Text("Regular").tag(ControlSize.regular)
                    Text("Large").tag(ControlSize.large)
                    Text("Extra Large").tag(ControlSize.extraLarge)
                }
                
                Picker("Button Size", selection: $model.buttonSize) {
                    Text("Automatic").tag(ButtonSizing.automatic)
                    Text("Fitted").tag(ButtonSizing.fitted)
                    Text("Flexible").tag(ButtonSizing.flexible)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    NavigationStack {
        ButtonDoc()
    }
}
