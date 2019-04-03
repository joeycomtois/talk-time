//
//  ViewController.swift
//  Talk Time
//
//  Created by Joey Comtois on 3/15/19.
//  Copyright © 2019 Keypress. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

struct global {
    static var conversationName = ""
    static var backgroundColor = UIColor.white
    static var navigationColor = UIColor.gray
    static var accentColor = UIColor.black
    static var theme = String()
    static var barStyle: UIStatusBarStyle = .default
    
    
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
            let popVC = storyboard?.instantiateViewController(withIdentifier: "home")
            return popVC
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalView = storyboard?.instantiateViewController(withIdentifier: "messages")
        show(finalView!, sender: self)
    }
    
 // var people = ["Jack", "Rated R", "Hunter", "José", "Dad", "Jordan", "Mom"]
 // var lastConvo = ["Vim is such a meme", "Lol", "We parked", "Attachment: 1 image", "Ah gotcha. Glad I asked you first", "Thank you", "Okee"]
 // var dates = ["10:05 AM", "Yesterday", "Friday", "Friday", "Thursday", "Thursday", "Thursday"]
 // var viewed = ["unread", "unread", "unread", "unread", "unread", "unread", "unread"]
 // var photos = ["jack", "ally", "emma", "hanna", "alessandro", "Joe", "Jordan"]
    
    var people = ["Chris", "Heather", "Amanda", "José", "Al", "Jayson", "Theresa"]
    var lastConvo = ["That sounds like a great idea!", "Can't wait to see you guys Thursday.", "Did you hear? A7X is coming to San Antonio.", "Attachment: 1 image", "Sweet! Glad I asked you first.", "I really appreciate it boss.", "Miss you guys tons."]
    var dates = ["10:05 AM", "Yesterday", "Friday", "Friday", "Thursday", "March 4th", "February 2nd"]
    var viewed = ["unread", "read", "unread", "read", "read", "read", "read"]
    var photos = ["jack", "none", "emma", "hanna", "none", "none", "Jordan"]
    
    var alreadyDone = 0
    

    @IBOutlet weak var homeConversations: UITableView!
    @IBOutlet weak var searchMessages: UIBarButtonItem!
    @IBOutlet weak var composeMessage: UIBarButtonItem!
    @IBOutlet var defaultUserPhoto: UIView!
    @IBOutlet var defaultUserLable: UILabel!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = tableView.dequeueReusableCell(withIdentifier: "convo", for: indexPath) as! ContactListViewCell
        
        conversation.userName.text = people[indexPath.row]
        conversation.userLastConvo.text = lastConvo[indexPath.row]
        conversation.convoDate.text = dates[indexPath.row]
        
        print(photos[indexPath.row])
        
        
        //if(photos[indexPath.row] == "none") {
//      //      let defaultPhoto = UIView()
//      //      defaultPhoto.frame.size = conversation.userPhoto.frame.size
//      //      defaultPhoto.layer.cornerRadius = defaultPhoto.frame.height / 2
//      //      defaultPhoto.backgroundColor = UIColor.red
        //
        //
        //    if conversation.userName.text != "" {
        //        //defaultUserLable.text = people[indexPath.row].substring(to: 1)
        //        //defaultUserLable.text = "G"
        //
        //
        //    } else {
        //        print("name")
        //    }
//
        //    saveImage(imageName: "\(people[indexPath.row])", image: image(with: defaultUserPhoto)!)
        //
//
        //    //conversation.userPhoto.image = UIImage(named: "\(people[indexPath.row])")
        //}
        
        
        if (photos[indexPath.row] == "none") {
            var newProfile = image(with: defaultUserPhoto)
            saveImage(imageName: people[indexPath.row], image: newProfile!)
                conversation.userPhoto.image = UIImage(named: people[indexPath.row])
            
        } else {
        print("working!")
        conversation.userPhoto.image = UIImage(named: photos[indexPath.row])
        }
        
        
        conversation.userName.textColor = global.accentColor
        conversation.userLastConvo.textColor = global.accentColor
        conversation.convoDate.textColor = global.accentColor
        
        
        if (viewed[indexPath.row] == "read") {
            conversation.userName.alpha = 0.6
            conversation.userLastConvo.alpha = 0.6
            conversation.convoDate.alpha = 0.6
            
            
        }
        //conversation.userPhoto.image = UIImage(named: "alessandro.png")
        
        
        
        return conversation
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversation = tableView.dequeueReusableCell(withIdentifier: "convo", for: indexPath) as! ContactListViewCell
        
        
        
        
        //    override var preferredStatusBarStyle: UIStatusBarStyle {
        //        return .lightContent
        //    }
        
        //    Create a new ViewController
        //        let taskView = UIViewController()
        //
        //        taskView.setNeedsStatusBarAppearanceUpdate()
        //
        //
        //        // Create background and set properties
        //        let background = UIView()
        //        background.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        //        background.backgroundColor = UIColor.init(red: 0.05490196078, green: 0.05490196078, blue: 0.05490196078, alpha: 1)
        //
        //
        //        // Adds the background to the screen
        //        taskView.view.addSubview(background)
        //
        //        // Set the title to be the assignment name
        //        taskView.title = people[indexPath.row]
        //
        //        // Animate the push to the new viewcontroller
        //        self.navigationController?.pushViewController(taskView, animated: true)
        //
        //
        
        //let nextMessages = MessagesViewController()
        
        
        //nextMessages.title = people[indexPath.row]
        
        
        global.conversationName = people[indexPath.row]
        
        
        
        
        performSegue(withIdentifier: "messageSegue", sender: self)
        
        
        
        
        
        if (viewed[indexPath.row] == "unread") {
            
            viewed[indexPath.row] = "read"
            
            conversation.userName.alpha = 0.6
            conversation.userLastConvo.alpha = 0.6
            conversation.convoDate.alpha = 0.6
            
            homeConversations.reloadData()
            
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        
    }
    
    let messagesVC = MessagesViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(rsa_encrypt(p: 11, q: 13))
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: homeConversations)
        }
        
        homeConversations.tableFooterView = UIView()
        
        
        
        
        
        
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        self.navigationController!.navigationBar.topItem!.title = "Talk Time"
        
        if (alreadyDone == 2) {
        performSegue(withIdentifier: "startSetup", sender: self)
        alreadyDone = 1
        }
        
        //let homeConvoTableCell = ContactListViewCell()
        global.theme = "dark"
        
        
        switch global.theme {
            case "classic": lightTheme()
            case "dark": darkTheme()
            case "green": greenTheme()
            default: lightTheme()
        }
        
        
        
       
        
    }
    
    func lightTheme() {
        global.barStyle = .default
        global.backgroundColor = UIColor.white
        global.accentColor = UIColor.black
    }
    
    func darkTheme() {
        global.barStyle = .lightContent
        global.backgroundColor = UIColor.black
        global.accentColor = UIColor.white
    }
    
    func greenTheme() {
        global.barStyle = .lightContent
        global.backgroundColor = UIColor.black
        global.accentColor = UIColor.green
        
        
    func setTheme() {
        self.navigationController?.navigationBar.barTintColor = global.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: global.accentColor]
        composeMessage.tintColor = global.accentColor
        searchMessages.tintColor = global.accentColor
        homeConversations.backgroundColor = global.backgroundColor
    }
    
}
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func generatePrime() -> Int {
        
        let p = 4
        
        
        
        
        return p
    }
    
    func gcd(a: Int, b: Int) -> Int {
        if (b == 0) {
            return a
        }
        
        return gcd(a: b, b: a % b)
    }
    
    func rsa_encrypt(p: Int, q: Int) -> Int { //[(Int,Int)] {
    

        let totient = (p - 1) * (q - 1)
        
        let e = gcd(a: 2, b: totient)
        
        return e
        //return [(2,3)]
    }
//    func saveImage(image: UIImage, name: String) -> Bool {
//        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
//            return false
//        }
//        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
//            return false
//        }
//        do {
//            try data.write(to: directory.appendingPathComponent(name)!)
//            return true
//        } catch {
//            print(error.localizedDescription)
//            return false
//        }
//    }

    func saveImage(imageName: String, image: UIImage) {
        
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
    }

    
    func image(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    
    
    var codename = ["ACROBAT", "ANDY", "BACKSEAT", "BAGPIPE", "BAMBOO", "BANDBOX", "BASEBALL", "BEEHIVE", "BELLHOP", "BELLHOP", "BIGTOP", "BIRDSEYE", "BLACKBOARD", "BLACKTOP", "BLOWTORCH", "BLUEPRINT", "BOARDWALK", "BOOKSTORE", "BRIMSTONE", "BROADSIDE", "BUCKEYE", "BUCKSHOT", "BULLDOG", "BUNGALOW", "CABLEBOY", "CACTUS", "CANDLESTICK", "CARBINE", "CARNATION", "CARPET", "CARTWHEEL", "CEMENT MIXE", "CHALLENGER", "CHANDELIER", "CHECKERBOAR", "CHECKMATE", "CLOUDBURST", "CLOVERLEAF", "COACH HOUSE", "COBWEB", "COMPANION", "CROSSBOW", "CROWN", "CURBSIDE", "DRIFTWOOD", "ELM", "FIRESIDE", "FOG HORN", "HANDSHAKE", "HEADLIGHT", "HILL TOP", "HORSEPOWER", "HUDSON", "LIGHTFOOT", "LIZARD", "MAGIC", "PACEMAKER", "PAVILLION", "PENINSULA", "PINCUSHION", "PLAYGROUND", "PORK CHOP", "PROFESSOR", "PUNCH BOWL", "RIDGELINE", "RINGSIDE", "ROADHOUSE", "SANDSTONE", "SHOTGUN", "SKYMASTER", "STORE ROOM", "STORM KING", "TOOL ROOM", "TOWER", "VOLCANO", "WAREHOUSE", "WINDSTONE", "ANGEL", "CALIBER", "CARAVAN", "CARBINE", "CARGO", "CAROUSEL", "CHARIOT", "COWPUNCHER", "DOG POUND", "ELECTRIC", "FALCON", "FULLBACK", "HALFBACK", "HEDGEHOG", "HOLLY", "HORSEHIDE", "HUNTSMAN", "KNEECAP", "MARINE", "NIGHTHAWK", "PATROLLER", "PIVOT", "ROADRUNNER", "SATURN", "SIGNATURE", "SOFTPACK", "STAGECOACH", "TRACER", "TRACKER", "TRAIL BREA", "TREASURE", "WHEELS DOW", "WHEELS UP", "CALICO", "CAMEO", "CANNONBALL", "CAVALIER", "CEDAR", "CENTURION", "CHESSMAN", "CHRISTOPHE", "CLAM CHOWD", "CLAW HAMME", "COPPERTONE", "CRYSTAL", "DAILY", "DANCER", "DASHER", "DEACON", "DECKHAND", "DERBY", "DIAMOND", "DIGGER", "DRAGON", "DUCHESS", "DUSTY", "DYNAMO", "EAGLE", "EVERGREEN", "FADEAWAY", "FAN JET", "FENCING MASTER", "FINLEY", "FIREPLUG", "FIRE TRUCK", "FISTFIGHT", "FLAG DAY", "FLIVVER", "FLOTUS", "FLYING FISH", "FOOTPRINT", "FOREFINGER", "FORWARD", "FOXCRAFT", "HALO", "HAWKEYE", "HERCULES", "HOTSHOT", "INSTRUCTOR", "KITTYHAWK", "LANCER", "LOCK MASTER", "LOTUS PETAL", "MIRACLE", "NAPOLEON", "PASS KEY", "PESO", "PINAFORE", "PRINCIPAL", "RADIANT", "RAINBOW", "RAWHIDE", "REDFERN", "REDWOOD", "RELIANT", "RHYME", "RIBBON", "RIDDLER", "ROSEBUD", "SCARLET", "SCORECARD", "SEARCHLIGHT", "SHEEPSKIN", "SNAPSHOT", "SNOWBANK", "SNOWSTORM", "SPRINGTIME", "STAIRCASE", "STARBURST", "STARDUST", "STARLIGHT", "STRAWBERRY", "SUNBURN", "SUNDANCE", "SUNSHINE", "SUPERVISOR", "SWORDFISH", "THUNDER", "TILLER", "TIMBERWOLF", "TRANQUILITY", "TRAPLINE", "TRIPPER", "TUMBLER", "TUNER", "UNICORN", "VICTORIA", "VOLUNTEER", "WELCOME", "WHALEBOAT", "WISDOM", "WOODCUTTER", "UNKNOWN", "APOLLO", "BACKHOE", "BALLFIELD", "BAREFOOT", "BUSCUIT", "BULLPEN", "BUNKER", "CARBON", "CASTLE", "CHAMPION", "CITADEL", "CLOTHES BRUSH", "CORKSCREW", "FABLE", "FRACTION", "GIMLET", "GLADIOLA", "GOFFER", "HOBNAIL", "KILEY", "MUSTANG", "PUSHBUTTON", "RAINBOW TRAIL", "REGISTER", "ROB ROY", "ROSEBUSH",  "SANDBOX", "SAWHORSE", "SHADOW", "SMELTER", "SPECTATOR", "STUTTER", "SUGARFOOT", "TAILOR", "TEMPLER", "TINKERBELL", "TRAFFIC", "TRANSIT", "WALNUT"]




}

