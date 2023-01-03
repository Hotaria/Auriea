//
//  FilmView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI

struct FilmView: View {
    var body: some View {
        
        VStack {
            Image(systemName:"plus.circle")
                .resizable()
            .frame(width: 100, height: 100)
            Text("Open...")
                .font(.headline)
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView()
    }
}
