//
//  AddNoteScreen.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

struct AddNoteScreen: View {
    @Environment(\.presentationMode) var envi
    @EnvironmentObject var vm:NotepadDataModel
    @State var note = ""
    var body: some View {
        VStack(spacing:20){
            HStack{
                Spacer()
                Image(systemName: "xmark")
                    .onTapGesture {
                        envi.wrappedValue.dismiss()
                    }
            }
            TextField("Enter Note here...", text: $note)
            if !note.isEmpty{
                Button{
                    vm.addNote(body: note)
                    print("Note Saved Successfully")
                    envi.wrappedValue.dismiss()
                }label:{
                    NormalButton(label:"Save")
                }
            }
            Spacer()
        }
        .padding()
    }
}


#Preview {
    AddNoteScreen()
}
