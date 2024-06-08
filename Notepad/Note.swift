//
//  Note.swift
//  Notepad
//
//  Created by MacBook  on 08/06/2024.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject, Identifiable {
    @NSManaged public var body: String?
}

