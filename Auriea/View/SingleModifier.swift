//
//  SingleModifier.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI

struct SingleModifier: View {
    var PropertyName: String
    var PropertyIcon: String
    @State var PropertyValue: Double
    @State private var speed = 50.0
    @State private var isEditing = false
    var body: some View {
        HStack (alignment: .top){
            Image(systemName: PropertyIcon)
                .resizable()
                .frame(width: 40, height: 40)
            Spacer()
                .frame(width: 20)
            VStack (alignment: .leading) {
                HStack {
                    Text(PropertyName + ":")
                        .font(.headline)
                    Text("\(PropertyValue)")
                        .font(.headline)
                }
                Slider(
                    value: $PropertyValue,
                            in: -100...100,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                )
                .tint(Color("GloriousDark"))
                .frame(width:300 ,height: 10)

            }
     
        }
        .foregroundColor(Color("GloriousDark"))
        .frame(height: 80)

    }
}

struct SingleModifier_Previews: PreviewProvider {
    static var previews: some View {
        SingleModifier(
            PropertyName: "Exposure",
            PropertyIcon: "plusminus.circle" ,
            PropertyValue: 50
        )
    }
}
