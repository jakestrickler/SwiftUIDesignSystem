//
//  ComponentList.swift
//  Apple Design System
//
//  Created by Jake on 1/16/26.
//

import SwiftUI

struct ComponentList: View {
    @State var model = ComponentModel()
    
    var body: some View {
        List {
            ForEach(model.components) { component in
                NavigationLink(component.name, value: component)
            }
        }
        .navigationTitle("Components")
        .navigationDestination(for: ComponentModel.Component.self) { component in
            switch component {
            case .button:
                ButtonDoc()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ComponentList()
    }
}
