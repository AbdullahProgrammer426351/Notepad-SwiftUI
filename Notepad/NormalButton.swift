//
//  NormalButton.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

struct NormalButton: View {
    let label :String
    var body: some View {
        Text(label)
            .padding(.vertical, 5)
            .padding(.horizontal, 50)
            .background(.black)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

#Preview {
    NormalButton(label:"Button")
}
