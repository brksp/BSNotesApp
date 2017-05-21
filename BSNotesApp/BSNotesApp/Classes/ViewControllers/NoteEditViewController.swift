//
//  NoteEditViewController.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 21/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var noteTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
//MARK: - UITableViewDataSource
extension NoteEditViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTitleTableViewCell", for: indexPath) as! NoteTitleTableViewCell
            cell.delegate = self
        return cell
    }
}
//MARK: - UITableViewDelegate
extension NoteEditViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
//        let currentOffset = noteTableView.contentOffset
//        UIView.setAnimationsEnabled(false)
        noteTableView.beginUpdates()
        noteTableView.endUpdates()
//        UIView.setAnimationsEnabled(true)
//        noteTableView.setContentOffset(currentOffset, animated: false)
    }
}
