//
//  Person.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/27/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import Foundation


public class PersonInfo {
    var firstName: String
    var lastName: String
    var city: String

    init(firstName: String?, lastName: String?, city: String?) {
        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
        self.city = city ?? ""
    }
}
