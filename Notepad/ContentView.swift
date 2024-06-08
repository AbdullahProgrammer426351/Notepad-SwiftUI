//
//  ContentView.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm:NotepadDataModel
    @State var show = false
    var body: some View {
        VStack {
            List{
                ForEach(vm.saveNoteEntity){item in
                    NoteCell(note: item)
                }
                .listRowInsets(EdgeInsets()) // Remove row insets if needed
                .listRowSeparator(.hidden)
            }
            Spacer()
            Button{
                show.toggle()
            }label:{
                NormalButton(label: "Add Note")
            }
        }
        .padding()
        .sheet(isPresented:$show){
            AddNoteScreen()
        }
    }
}

#Preview {
    ContentView()
}
