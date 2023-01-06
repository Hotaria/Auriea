//
//  ContentView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI
import UniformTypeIdentifiers


struct ContentView: View {
    @EnvironmentObject var Properties: MultiProp
    var body: some View {
        HStack (alignment: .center){
            ModifyView()
                .environmentObject(Properties)
            Spacer()
            FilmView()
                .environmentObject(Properties)
            LenView()
        }
        .scaledToFit()

    }
}

struct ContentView_Previews: PreviewProvider {
    //@EnvironmentObject var Properties: MultiProp
    static var previews: some View {
        Group {
                    ContentView()
                        .environmentObject(MultiProp())
                        .preferredColorScheme(.light)
                    ContentView()
                    .environmentObject(MultiProp())
                        .preferredColorScheme(.dark)
                }
    }
}
