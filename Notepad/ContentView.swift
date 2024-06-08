//
//  ContentView.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: NotepadDataModel
    @State private var show = false
    @State private var selectedNote: Note?

    var body: some View {
        VStack {
            List {
                ForEach(vm.saveNoteEntity) { item in
                    NoteCell(note: item)
                        .onTapGesture {
                            selectedNote = item
                            show.toggle()
                        }
                }
                .listRowInsets(EdgeInsets()) // Remove row insets if needed
                .listRowSeparator(.hidden)
            }
            Spacer()
            Button {
                selectedNote = nil
                show.toggle()
            } label: {
                NormalButton(label: "Add Note")
            }
        }
        .padding()
        .sheet(isPresented: $show) {
            AddNoteScreen(note: $selectedNote)
        }
    }
}

#Preview {
    ContentView()
}
