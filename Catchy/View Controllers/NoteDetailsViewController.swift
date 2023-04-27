//
//  NoteDetailsViewController.swift
//  Catchy
//
//  Created by Mohamed Atallah on 19/03/2023.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    var note: Note!
    var dataController: DataController!
    var onDelete: (() -> Void)?
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()

    // MARK: - Life cycle
        override func viewDidLoad() {
            super.viewDidLoad()

            if let creationDate = note.creationDate {
                navigationItem.title = dateFormatter.string(from: creationDate)
            }
            textView.attributedText = note.attributedText

        }
    
    // MARK: - Actions
    @IBAction func deleteNote(sender: Any) {
        presentDeleteNotebookAlert()
    }
}

// MARK: - Editing

extension NoteDetailsViewController {
    func presentDeleteNotebookAlert() {
        let alert = UIAlertController(title: "Delete Note", message: "Do you want to delete this note?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: deleteHandler))
        present(alert, animated: true, completion: nil)
    }

    func deleteHandler(alertAction: UIAlertAction) {
        onDelete?()
    }
}

// MARK: - UITextViewDelegate

extension NoteDetailsViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note.attributedText = textView.attributedText
        try? dataController.viewContext.save()
        
    }
}

