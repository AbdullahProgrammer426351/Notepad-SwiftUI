//
//  NotepadDataModel.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import Foundation
import CoreData

class NotepadDataModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var saveNoteEntity: [Note] = []
    
    init() {
        container = NSPersistentContainer(name: "NotepadDB")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading data \(error)")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            saveNoteEntity = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching data \(error)")
        }
    }
    
    func addNote(body: String) {
        let newNote = Note(context: container.viewContext)
        newNote.body = body
        saveData()
    }
    
    func deleteNote(note: Note) {
        container.viewContext.delete(note)
        saveData()
    }
    
    func updateNote(note: Note, newBody: String) {
        note.body = newBody
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchData()  // Ensure data is fetched after saving
        } catch {
            print("Error saving data \(error)")
        }
    }
}
