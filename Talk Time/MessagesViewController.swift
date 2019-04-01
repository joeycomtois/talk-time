//
//  MessagesViewController.swift
//  Talk Time
//
//  Created by Joey Comtois on 3/18/19.
//  Copyright © 2019 Keypress. All rights reserved.
//

import UIKit

extension UILabel {
    
    var isTruncated: Bool {
        
        guard let labelText = text else {
            return false
        }
        
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil).size
        
        return labelTextSize.height > bounds.size.height
    }
}


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messageDirection = ["sent", "received", "received", "received", "sent", "sent", "sent", "sent", "received", "sent", "received", "sent"]
    var convo = ["That sounds like a great idea!", "Can't wait to see you guys Thursday.", "Did you hear? A7X is coming to San Antonio.", "Attachment: 1 image", "Sweet! Glad I asked you first.", "I really appreciate it boss.", "Miss you guys tons.", "I have a furry cat.", "Ms. Potatohead really pushes her stay", "When will George finally understand what virginity is?", "Russy J is kinda bitchy after his kid popped out.", "Suck my dick.", "Love you too!"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageDirection.count
        
    }
    
    @IBOutlet weak var messagesConversationTableView: UITableView!
    var something = false
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        
        
      
        
        
        
        
        //let cell = UITableViewCell
        
        if(messageDirection[indexPath.row] == "sent") {
            let outgoing = tableView.dequeueReusableCell(withIdentifier: "outgoing", for: indexPath) as! ConversationTableViewCell
            
            outgoing.messageMessageText.text = convo[indexPath.row]
            outgoing.messageMessageText.sizeToFit()
            
            if (outgoing.messageMessageText.isTruncated == true || outgoing.messageMessageText.frame.width > 230) {
                outgoing.messageMessageText.frame.size = CGSize(width: 230, height: outgoing.messageMessageText.frame.height)
                    print("truncated | \(convo[indexPath.row])")
                outgoing.messageMessageText.numberOfLines += 1
                outgoing.messageMessageText.frame.size = CGSize(width: outgoing.messageMessageText.frame.width, height: outgoing.messageMessageText.frame.height * 2)
                outgoing.messageMessageBox.frame.size = CGSize(width: outgoing.messageMessageBox.frame.width, height: outgoing.messageMessageBox.frame.height * 2)

//                messagesConversationTableView.rowHeight = outgoing.messageMessageBox.frame.height
            } else {
                print("fitted | \(convo[indexPath.row]) | \(outgoing.messageMessageText.frame.width)")
            }

            
            outgoing.messageMessageBox.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            
            
            return outgoing
            
        
        }
            
            
            
            
            
        else {
            let incoming = tableView.dequeueReusableCell(withIdentifier: "incoming", for: indexPath) as! ConversationTableViewCell
            incoming.messageMessageText.text = convo[indexPath.row]
            incoming.messageMessageText.sizeToFit()
            
            //if (incoming.messageMessageText.isTruncated == true || incoming.messageMessageText.frame.width > 230) {
            //    incoming.messageMessageText.frame.size = CGSize(width: 230, height: incoming.messageMessageText.frame.height)
            //    print("truncated | \(convo[indexPath.row])")
            //    incoming.messageMessageText.numberOfLines += 1
            //    incoming.messageMessageText.frame.size = CGSize(width: incoming.messageMessageText.frame.width, height: incoming.messageMessageText.frame.height * //2)
            //    incoming.messageMessageBox.frame.size = CGSize(width: incoming.messageMessageBox.frame.width, height: incoming.messageMessageBox.frame.height * 2)
            //
            //               messagesConversationTableView.rowHeight = incoming.messageMessageBox.frame.height
            //} else {
            //    print("fitted | \(convo[indexPath.row]) | \(incoming.messageMessageText.frame.width)")
            //}
            //
            //
            incoming.messageMessageBox.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
            //
            return incoming
        }
        
        
        
        
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return UITableView.automaticDimension
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.topItem!.title = ""
        
        messagesConversationTableView.estimatedRowHeight = 50
        //messagesConversationTableView.rowHeight = UITableView.automaticDimension
        
        self.title = global.conversationName
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        something = false
        
        
        
    }
    override func viewDidLoad() {
       messagesConversationTableView.rowHeight = UITableView.automaticDimension
       messagesConversationTableView.estimatedRowHeight = 45
    }
}

