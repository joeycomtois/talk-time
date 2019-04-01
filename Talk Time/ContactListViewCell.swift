//
//  ContactListViewCell.swift
//  Talk Time
//
//  Created by Joey Comtois on 3/15/19.
//  Copyright © 2019 Keypress. All rights reserved.
//

import UIKit

class ContactListViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLastConvo: UILabel!
    @IBOutlet weak var convoDate: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
