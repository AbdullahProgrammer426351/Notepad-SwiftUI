//
//  NoteCell.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

struct NoteCell: View {
    let note:Note
    var body: some View {
        Text(note.body ?? "Demo Title")
            .padding(.horizontal)
            .background(.windowBackground)
            .foregroundStyle(.primary)
            .font(.title2)
            .padding()
            .cornerRadius(10)
        
    }
}

#Preview {
    NoteCell(note : Note())
}
