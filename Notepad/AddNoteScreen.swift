//
//  AddNoteScreen.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

struct AddNoteScreen: View {
    @Environment(\.presentationMode) var envi
    @EnvironmentObject var vm: NotepadDataModel
    @Binding var note: Note?
    @State private var noteBody: String = ""

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .onTapGesture {
                        if let note = note {
                            vm.deleteNote(note: note)
                            envi.wrappedValue.dismiss()
                        }
                    }
                Image(systemName: "xmark")
                    .onTapGesture {
                        envi.wrappedValue.dismiss()
                    }
            }
            TextField("Enter Note here...", text: $noteBody)
            if !noteBody.isEmpty {
                Button {
                    if let note = note {
                        vm.updateNote(note: note, newBody: noteBody)
                        print("Note Updated Successfully")
                    } else {
                        vm.addNote(body: noteBody)
                        print("Note Saved Successfully")
                    }
                    envi.wrappedValue.dismiss()
                } label: {
                    NormalButton(label: "Save")
                }
            }
            Spacer()
        }
        .padding()
        .onAppear {
            if let note = note {
                noteBody = note.body ?? ""
            }
        }
    }
}

#Preview {
    AddNoteScreen(note: .constant(nil))
}
