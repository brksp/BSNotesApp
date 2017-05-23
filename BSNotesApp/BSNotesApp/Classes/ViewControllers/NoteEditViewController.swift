//
//  NoteEditViewController.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 21/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
class NoteEditViewController: UIViewController {
    
    enum CellType {
        case Title
        case Note
    }

    //MARK: - Properties
    @IBOutlet weak var noteTableView: UITableView!
    
    var realm: Realm!
    
    override func viewDidLoad() {
        realm = try! Realm()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTableCell() {
        noteTableView.beginUpdates()
        noteTableView.endUpdates()
    }

}
//MARK: - UITableViewDataSource
extension NoteEditViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == CellType.Title.hashValue {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == CellType.Title.hashValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTitleTableViewCell", for: indexPath) as! NoteTitleTableViewCell
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditableNoteTableViewCell", for: indexPath) as! EditableNoteTableViewCell
        cell.delegate = self
        return cell
    }
}
//MARK: - UITableViewDelegate
extension NoteEditViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == CellType.Title.hashValue {
            return 30
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //            try! realm.write {
            ////                realm.delete(objectForIndexPath(indexPath: indexPath)!)
            //            }
        }
    }
}

//MARK: - NoteTitleTableViewCellDelegate
extension NoteEditViewController : NoteTitleTableViewCellDelegate {
    func textViewDidChange() {
        updateTableCell()
    }
    
    func textViewDidEndEditing() {
        add()

        if let cell = noteTableView.visibleCells.last as? EditableNoteTableViewCell{
            cell.noteTextView.becomeFirstResponder()
        }
    }
    
    func backgroundAdd() {
        // Import many items in a background thread
        DispatchQueue.global().async {
            // Get new realm and table since we are in a new thread
            let realm = try! Realm()
            realm.beginWrite()
            for _ in 0..<5 {
                // Add row via dictionary. Order is ignored.
//                realm.create(DemoObject.self, value: ["title": randomTitle(), "date": NSDate(), "sectionTitle": randomSectionTitle()])
            }
            try! realm.commitWrite()
        }
    }
    
    func add() {
        try! realm.write {
            let check = CheckBox()
            check.hasCheckBox = false
            check.isChecked = false
            realm.create(Note.self, value: ["title": "asdasdad", "spot": "1231qweqewq", "check": check], update: true)
            
        }
        
        try! realm.write {
            let l = try! Realm().objects(Note.self).sorted(byKeyPath: "title")
            print(l)
//            for o in l {
//                realm.delete(o)
//            }
        }
    }
}

//MARK: - EditableNoteTableViewCellDelegate
extension NoteEditViewController : EditableNoteTableViewCellDelegate {
    func noteTextViewDidChange() {
        updateTableCell()
    }
}
