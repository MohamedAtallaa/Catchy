//
//  Note + EXT.swift
//  Catchy
//
//  Created by Mohamed Atallah on 17/04/2023.
//

import Foundation
import CoreData

extension Note {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
