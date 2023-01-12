//
//  ModifyView.swift
//  Lency
//
//  Created by Ode on 2023/1/2.
//

import SwiftUI


struct ModifyView: View {
    @EnvironmentObject var Properties: MultiProp

    var body: some View {
        ScrollView (showsIndicators: false){
            ForEach(Properties.Proper.indices, id: \.self ) { index in
                VStack {
                    HStack (alignment: .center){
                        Image(systemName: self.Properties.Proper[index].icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Spacer()
                            .frame(width: 20)
                        VStack (alignment: .leading) {
                            HStack {
                                Text(self.Properties.Proper[index].name + ":")
                                    .font(.headline)
                                Text("\(self.Properties.Proper[index].value)")
                                    .font(.headline)
                            }
                            Slider(
                                value: self.$Properties.Proper[index].value,
                                        in: -1...1
                                        /*onEditingChanged: { editing in
                                            isEditing = editing
                                        }*/
                            )
                            .tint(Color("GloriousDark"))
                            .frame(width:200 ,height: 10)

                        }
                    }
                    .frame(width: 300, height: 60)
                    .background(Color("GloriousWhite"))
                    .foregroundColor(Color("GloriousDark"))
                }
                .padding(.vertical, 2)
                Divider()
                    .padding(0)
            }
        }
        .padding(.vertical, 10)
        .background(Color("GloriousWhite"))
        .frame(minWidth: 300, maxWidth: 300, minHeight: 600, maxHeight: 10000)
    }
}

struct ModifyView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
            .environmentObject(MultiProp())
    }
}
