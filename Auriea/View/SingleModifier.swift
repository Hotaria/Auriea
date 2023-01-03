//
//  SingleModifier.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI

struct SingleModifier: View {
    var body: some View {
        HStack {

            Image(systemName: "plusminus.circle")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
     
        }
        .padding(.all)
    }
}

struct SingleModifier_Previews: PreviewProvider {
    static var previews: some View {
        SingleModifier()
    }
}
