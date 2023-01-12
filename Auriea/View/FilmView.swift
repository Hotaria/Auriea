//
//  FilmView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI
import AppKit
import UniformTypeIdentifiers

struct ImageDocument: FileDocument {
  static var readableContentTypes: [UTType] { [.jpeg, .png, .tiff] }
  var image: NSImage
  init(image: NSImage?) {
    self.image = image ?? NSImage()
  }
  init(configuration: ReadConfiguration) throws {
    guard let data = configuration.file.regularFileContents,
          let image = NSImage(data: data)
    else {
      throw CocoaError(.fileReadCorruptFile)
    }
    self.image = image
  }
  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    /* You can replace tiff representation with what you want to export */
    return FileWrapper(regularFileWithContents: image.tiffRepresentation!)
  }
}



struct FilmView: View {
    @EnvironmentObject var Properties: MultiProp
    @State private var fileUrl = ""
    @State private var openFile = false
    @State private var saveFile = false
    @State private var img = NSImage(imageLiteralResourceName: "InitialImage")
    var body: some View {
        
        VStack {
            Text("\(fileUrl)").fontWeight(.bold)
            HStack {
                Button(action: {
                    print("LOAD was tapped")
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
                Button(action: {
                    print("SAVE was tapped")
                    saveFile.toggle()
                    
                }) {
                    Image(systemName:"chevron.down.circle")
                    Text("Save...")

                }.fileExporter(
                    isPresented: $saveFile,
                    documents: [
                        ImageDocument(image: img)
                      ],
                    contentType: UTType.png
                ) { result in
                    switch result {
                    case .success(let url):
                        print("Saved to \(url)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            Spacer()
            Image(nsImage: img)
                .resizable()
                .padding(.all)
                .scaledToFit()
                .brightness(Properties.Proper[1].value)
                .hueRotation(Angle.degrees(Properties.Proper[4].value * 180))
                .saturation(Properties.Proper[3].value + 1)
                .contrast(Properties.Proper[2].value + 1)

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
        .frame(minWidth:0, maxWidth: 1000, minHeight: 400,maxHeight: 10000)
        //.background(Color("GloriousLightGrey"))
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView()
            .environmentObject(MultiProp())
    }
}
