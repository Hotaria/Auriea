//
//  FilmView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI
import AppKit


struct FilmView: View {
    @EnvironmentObject var Properties: MultiProp
    @State private var fileUrl = ""
    @State private var openFile = false
    @State private var img = NSImage(size: NSSize(width: 20, height: 20))
    var body: some View {
        
        VStack {
        
            Text("\(fileUrl)").fontWeight(.bold)
            Spacer()
            Image(nsImage: img)
                .resizable()
                .scaledToFit()
                //.frame(minWidth: 20, idealWidth: 20 ,maxWidth: 1080, minHeight: 20,idealHeight: 20, maxHeight: 960)
                .brightness(Properties.Proper[1].value)
                .hueRotation(Angle.degrees(Properties.Proper[10].value * 180))
                .saturation(Properties.Proper[7].value + 1)
                .contrast(Properties.Proper[5].value + 1)
            
            
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
                    self.img = img!
                    
                } catch{
                    print("Error happend")
                }
               
                
            }
            Spacer()

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
        .scaledToFit()
        .frame(width: 900)
        .background(Color("GloriousLightGrey"))
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(   )
    }
}
