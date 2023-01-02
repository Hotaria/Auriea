//
//  ContentView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ModifyView()
            FilmView()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
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
