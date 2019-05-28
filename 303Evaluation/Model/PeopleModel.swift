//
//  PersonModel.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/23/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import Foundation


class PeopleModel {
    static let sharedInstance = AppModel()

    let jsonRestService = JSONRestService()
    var people = [Person]()
    
    var personCount : Int {
        return people.count
    }
    
    
}
