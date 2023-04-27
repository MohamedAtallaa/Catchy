//
//  Cell\.swift
//  Catchy
//
//  Created by Mohamed Atallah on 19/03/2023.
//

import UIKit

protocol Cell: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension Cell {
    static var defaultReuseIdentifier: String {
        return "\(self)"
    }
}

