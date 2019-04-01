//
//  ConversationTableViewCell.swift
//  Talk Time
//
//  Created by Joey Comtois on 3/18/19.
//  Copyright © 2019 Keypress. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var messageMessageBox: UIView!
    @IBOutlet weak var messageMessageText: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
