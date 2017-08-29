
import UIKit

class EventManager {
    static let sharedInstance = EventManager()
    
    var events = [Event]()
    
    var count : Int {
        get {
            return events.count
        }
    }
    func eventAtIndex(index : Int) ->Event {
        return events[index]
    }
    
    func addNewEvent (name: String, location: String, time: String, requirements: String) {
        let event = Event(name: name, location: location, time: time, requirements: requirements)
        events.append(event)
        addToDatabase(event)
    }
    func addNewEvent (event: Event) {
        events.append(event)
        addToDatabase(event)
    }
    func addToDatabase (event: Event) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let client = delegate.client!
        let itemTable = client.tableWithName("Events")
        itemTable.insert(["name": event.name,
                          "location": event.location,
                          "time": event.time,
                          "requirements": event.requirements])
        {
            (insertedItem, error) in
            if (error != nil) {
                print("Error" + error!.description);
            }
            else {
                print("Item inserted, id: ", insertedItem!["id"])
            }
        }
    }
    private init() {
        events.append(Event(name: "first event", location: "Thorton Hall A120", time: "5pm", requirements: "Must be e-school"))
        events.append(Event(name: "Free Donuts", location: "Clark Library Stacks", time: "7pm", requirements: "NA"))
        events.append(Event(name: "Free Shirts", location: "Hack Cville", time: "9pm", requirements: "Must be a member"))
    }
}