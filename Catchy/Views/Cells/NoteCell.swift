//
//  NoteCell.swift
//  Catchy
//
//  Created by Mohamed Atallah on 19/03/2023.
//

import UIKit

internal final class NoteCell: UITableViewCell, Cell {
    // Outlets
    @IBOutlet weak var textPreviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        textPreviewLabel.text = nil
        dateLabel.text = nil
    }
}
