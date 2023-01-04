//
//  ModifyView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI

struct ModifyView: View {
    private struct Prop: Identifiable {
        let name: String
        let icon: String
        var value: Double
        var id: String { name }
    }
    private let Properties: [Prop] = [
        Prop(name: "Exposure", icon: "plusminus.circle", value: 0),
        Prop(name: "Brilliance", icon: "plusminus.circle", value: 0),
        Prop(name: "Highlights", icon: "plusminus.circle", value: 0),
        Prop(name: "Shadows", icon: "plusminus.circle", value: 0),
        Prop(name: "Contrast", icon: "plusminus.circle", value: 0),
        Prop(name: "Brightness", icon: "plusminus.circle", value: 0),
        Prop(name: "Black Point", icon: "plusminus.circle", value: 0),
        Prop(name: "Saturation", icon: "plusminus.circle", value: 0),
        Prop(name: "Vibrance", icon: "plusminus.circle", value: 0),
        Prop(name: "Warmth", icon: "plusminus.circle", value: 0),
        Prop(name: "Tint", icon: "plusminus.circle", value: 0),
        Prop(name: "Sharpness", icon: "plusminus.circle", value: 0),
        Prop(name: "Definition", icon: "plusminus.circle", value: 0),
        Prop(name: "Noise Reduction", icon: "plusminus.circle", value: 0),
        Prop(name: "Vignette", icon: "plusminus.circle", value: 0),
        
    ]

    var body: some View {
        ScrollView (showsIndicators: false){
            ForEach(Properties) { prop in
                SingleModifier(
                    PropertyName: prop.name,
                    PropertyIcon: prop.icon ,
                    PropertyValue: prop.value
                )

                
            }
        }
        .scaledToFit()
        .frame(width: 400, height:600)
    }
}

struct ModifyView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
    }
}
