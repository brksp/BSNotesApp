//
//  NotesViewController.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 17/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit
//import RealmSwift

class NotesViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var notesTableView: UITableView!
    
//    var realm: Realm!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        notesTableView.reloadData()
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeSelectedStatesOfTableView()
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func removeSelectedStatesOfTableView() {
        if let indexPaths = notesTableView.indexPathsForSelectedRows {
            for indexPath in indexPaths {
                notesTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
//MARK: - UITableViewDataSource
extension NotesViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
        cell.titleLabel.text = "TEST"
        if indexPath.row % 2 == 0 {
            cell.spotLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a luctus nisi. Pellentesque mauris leo, vehicula non bibendum eu, tempor at urna. Praesent sodales elit libero, ac ultrices ligula porttitor dictum. Etiam mattis hendrerit urna nec dignissim. Donec blandit mauris orci, in suscipit dui facilisis quis. Aenean ut pellentesque purus, non faucibus erat. Duis aliquam blandit mauris, ut vulputate nisl dignissim eget. Proin elementum turpis vitae enim faucibus lacinia nec quis nisi."
        }else {
            cell.spotLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a luctus nisi. Pellentesque mauris leo, vehicula non bibendum eu, tempor at urna."
        }
        return cell
    }
}
//MARK: - UITableViewDelegate
extension NotesViewController : UITableViewDelegate {
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
