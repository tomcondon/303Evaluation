//
//  PeopleModel
//  303Evaluation
//
//  Created by Thomas Condon on 5/23/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import Foundation


class PeopleModel {
    public static let modelUpdated = NSNotification.Name("ModelUpdated")

    let peopleUrl = "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true"

    static let sharedInstance = PeopleModel()

    let personRestService = PeopleRestService()

    var personInfos = [PersonInfo]()

    var personCount: Int {
        return personInfos.count
    }

    // enforce being a singleton
    private init() {
    }

    public func populatePeople() {
        personRestService.fetchPeople(urlString: peopleUrl) { people in
            self.personInfos = people.map {
                PersonInfo(firstName: $0.fname, lastName: $0.lname, city: $0.city) //Turn from Codable struct to Class
            }
            // Let's make sure we notify on the main Queue
            DispatchQueue.main.async() {
                NotificationCenter.default.post(name: PeopleModel.modelUpdated, object: nil)
            }
        }
    }
}
