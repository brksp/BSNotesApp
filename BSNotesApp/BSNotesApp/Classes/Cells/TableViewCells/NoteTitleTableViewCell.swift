//
//  NoteTitleTableViewCell.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 21/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit

@objc protocol NoteTitleTableViewCellDelegate {
    @objc optional func textViewDidChange()
}


class NoteTitleTableViewCell: UITableViewCell {
    
    weak var delegate: NoteTitleTableViewCellDelegate?
    @IBOutlet weak var titleTextView: UITextView!{
        didSet{
            titleTextView.becomeFirstResponder()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension NoteTitleTableViewCell : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.textViewDidChange!()
    }
}
