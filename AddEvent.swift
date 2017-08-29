
import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var locationLabel: UITextField!
    
    @IBOutlet weak var timeLabel: UITextField!
    
    @IBOutlet weak var requireLabel: UITextField!
    
    @IBOutlet weak var Submit: UIButton!
    
    @IBAction func Submit(sender: UIButton) {
        let test = Event(name: titleLabel.text!,location: locationLabel.text!, time: timeLabel.text!, requirements: requireLabel.text!)
        EventManager.sharedInstance.addNewEvent(test)
       // EventManager.sharedInstance.addNewEvent(titleLabel.text!,location: locationLabel.text!, time: timeLabel.text!, requirements: requireLabel.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddEventViewController.textChanged(_:)), name: UITextFieldTextDidChangeNotification, object: nil)
        Submit.enabled = false
    }
    
    func textChanged(sender:NSNotification) {
        if (titleLabel.text!.isEmpty || locationLabel.text!.isEmpty || timeLabel.text!.isEmpty || requireLabel.text!.isEmpty) {
            Submit.enabled = false
        }
        else {
            Submit.enabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


