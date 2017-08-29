import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    // Tableview Data source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventManager.sharedInstance.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
// config cell
        let event = EventManager.sharedInstance.eventAtIndex(indexPath.row)
        cell.textLabel?.text = event.name
       
        cell.detailTextLabel?.text = event.location + "- " + event.time
        /*
        if(indexPath.row > 1 && indexPath.row % 2 == 0) {
        cell.backgroundColor = UIColor (red: 0.502, green: 0.949, blue: 0.9882, alpha: 0.4)
        }
        if(indexPath.row == 0) {
        cell.backgroundColor = UIColor (red: 0.502, green: 0.949, blue: 0.9882, alpha: 0.4)
        }
        if(indexPath.row == 1 || indexPath.row % 2 != 0) {
        cell.backgroundColor = UIColor (red: 0.7765, green: 0.5922, blue: 0.9882, alpha: 0.4)
        }
        */
        return cell
        
    }
    

    
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var event = EventManager.sharedInstance.eventAtIndex(indexPath.row)
        var eventDetails : EventDetails = self.storyboard!.instantiateViewControllerWithIdentifier("eventDetails") as! EventDetails
        eventDetails.name = event.name
        eventDetails.location = event.location
        eventDetails.time = event.time
        eventDetails.requirements = event.requirements
        print(event.name)
        print(eventDetails.name)
        
        self.presentViewController(eventDetails, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
    tableView.reloadData()
        
   }
   override func viewDidLoad() {
        super.viewDidLoad()
    
    /*var imgView = UIImageView(frame: self.view.frame)
    var img = UIImage(named: "Rotunda_May_2013_CG")!
    imgView.img = img
    self.view.addSubview(imgView)
    self.view.sendSubviewToBack(imgView)*/
    
    //let s = UIImage(named: "Rotunda_May_2013_CG")
    //self.view.backgroundColor = UIColor(patternImage: s!)
    /*let blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
    let blurView = UIVisualEffectView(effect: blur)
    view.addSubview(blurView) as! UIImageView*/

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

