
import UIKit

class EventDetails: UIViewController {

  //  @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var requireLabel: UILabel!
    var time : String?
    var location : String?
    var requirements : String?
    var name : String?
    
    
    override func viewWillAppear(animated: Bool) {
      //  self.titleLabel.text = name
        self.locationLabel.text = location
        self.timeLabel.text = time
        self.requireLabel.text = requirements
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
