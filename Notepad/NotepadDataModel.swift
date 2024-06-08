//
//  NotepadDataModel.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import Foundation
import CoreData


class NotepadDataModel:ObservableObject{
    let contanier : NSPersistentContainer
    @Published var saveNoteEntity:[Note] = []
    
    
    init() {
        contanier = NSPersistentContainer(name:"NotepadDB")
        contanier.loadPersistentStores{(descrip,errer) in
            if let errer = errer{
                print("Error loading data \(errer)")
            }
        }
        fetchData()
    }
    
    
    func fetchData(){
        let request = NSFetchRequest<Note>(entityName:"Note")
        
        do{
            saveNoteEntity = try contanier.viewContext.fetch(request)
        }catch let error{
            print("Error fetching data \(error)")
        }
    }
    
    
    func addNote(body:String){
        let newNote = Note(context: contanier.viewContext)
        
        newNote.body = body
        
        saveData()
    }
    
    func deleteNote(note: Note) {
            contanier.viewContext.delete(note)
            saveData()
        }

        func updateNote(note: Note, newBody: String) {
            note.body = newBody

            saveData()
        }
    
    func saveData(){
        do{
            try contanier.viewContext.save()
            fetchData()
        }catch{
            print("Error in saving data \(error)")
        }
    }
    
}
