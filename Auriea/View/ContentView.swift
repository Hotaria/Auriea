//
//  ContentView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI
import UniformTypeIdentifiers


struct ContentView: View {
    var body: some View {
        HStack (alignment: .center, spacing: 0){
            ModifyView()
            FilmView()
            LenView()
        }
        .scaledToFit()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                    ContentView()
                        .preferredColorScheme(.light)
                    ContentView()
                        .preferredColorScheme(.dark)
                }
    }
}
