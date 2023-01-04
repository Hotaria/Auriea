//
//  FilmView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI
import AppKit


struct FilmView: View {
    @State private var fileUrl = ""
    @State private var openFile = false
    @State private var img: NSImage?
    var body: some View {
        
        VStack {
            Text("\(fileUrl)").fontWeight(.bold)
            Image(nsImage: (img ?? NSImage(systemSymbolName: "plus.circle", accessibilityDescription: "Add")!))
                .resizable()
                .frame(width: 30, height: 30)
            Button(action: {
                print("Button was tapped")
                openFile.toggle()
                
            }) {
                Image(systemName:"plus.circle")
                Text("Open...")

                
            }.fileImporter(isPresented: $openFile, allowedContentTypes: [.image]) { (res) in
                
                do{
                    let fileUrl = try res.get()
                    print(fileUrl)
                    
                    self.fileUrl = fileUrl.absoluteString
                    
                    let img = NSImage(contentsOf: fileUrl)
                    self.img = img
                    
                } catch{
                    print("Error happend")
                }
               
                
            }


            /*
             Image(systemName:"plus.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: Color("ShadowGrey"),radius: 10)
            Text("Open...")
                .font(.headline)
                .shadow(color: Color("ShadowGrey"),radius: 10)
             */
        }
        .frame(width: 800, height: 600)
        .background(Color("GloriousWhite"))
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(   )
    }
}
