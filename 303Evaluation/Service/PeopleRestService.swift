//
//  PeopleRestService.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/26/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import Foundation


// MARK: - PersonElement
public struct PersonElement: Codable {
    let fname, lname, city: String?
}

public typealias People = [PersonElement]


public class PeopleRestService : JSONRestService {

    public override init() {
        super.init()
    }

    public func fetchPeople(urlString: String, completion: @escaping (People) -> ()) {
        if let url = URL(string: urlString) {
            self.get(url: url, successCompletion: completion, errorCompletion: {
                error in
                print("Error = \(String(describing: error?.localizedDescription))")
            })
        }
    }
}