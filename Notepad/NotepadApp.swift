//
//  NotepadApp.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import SwiftUI

@main
struct NotepadApp: App {
    @StateObject var vm:NotepadDataModel = NotepadDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NotepadDataModel())
        }
    }
}
