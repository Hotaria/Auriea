//
//  AurieaApp.swift
//  Auriea
//
//  Created by Ode on 2023/1/3.
//

import SwiftUI

struct SingleProp: Identifiable {
    let name: String
    let icon: String
    var value: Double
    var id: String { name }
}
class MultiProp: ObservableObject {
    @Published var Proper : [SingleProp] = [
    SingleProp(name: "Exposure", icon: "line.3.crossed.swirl.circle", value: 0),
    SingleProp(name: "Brilliance", icon: "sun.max.circle", value: 0),
    SingleProp(name: "Highlights", icon: "plusminus.circle", value: 0),
    SingleProp(name: "Shadows", icon: "moon.circle", value: 0),
    SingleProp(name: "Contrast", icon: "circle.righthalf.filled", value: 0),
    SingleProp(name: "Brightness", icon: "bolt.horizontal.circle", value: 0),
    SingleProp(name: "Black Point", icon: "smallcircle.filled.circle", value: 0),
    SingleProp(name: "Saturation", icon: "drop.circle", value: 0),
    SingleProp(name: "Vibrance", icon: "leaf.circle", value: 0),
    SingleProp(name: "Warmth", icon: "flame.circle", value: 0),
    SingleProp(name: "Tint", icon: "circle.hexagongrid.circle", value: 0),
    SingleProp(name: "Sharpness", icon: "triangle.circle", value: 0),
    SingleProp(name: "Definition", icon: "diamond.circle", value: 0),
    SingleProp(name: "Noise Reduction", icon: "waveform.circle", value: 0),
    SingleProp(name: "Vignette", icon: "circle.dashed", value: 0),
    ]
}

@main
struct AurieaApp: App {
    @StateObject var Properties = MultiProp()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Properties)
        }
    }
}
