
import UIKit

class Event {
    var name: String!
    var location: String!
    var time: String!
    var requirements: String!
    
    init(name: String, location: String, time: String, requirements: String) {
        self.name = name
        self.location = location
        self.time = time
        self.requirements = requirements
    }
}

