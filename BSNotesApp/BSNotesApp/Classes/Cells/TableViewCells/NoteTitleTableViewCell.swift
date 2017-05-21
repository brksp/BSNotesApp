//
//  NoteTitleTableViewCell.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 21/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit

class NoteTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
