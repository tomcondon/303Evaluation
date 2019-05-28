//
//  PeopleTableViewController.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/23/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PeopleTableViewController.modelUpdated),
                                               name: PeopleModel.modelUpdated, object: nil)
        title = "People/Places"
        PeopleModel.sharedInstance.populatePeople()
    }
    
    @objc func modelUpdated(notification: NSNotification) {
        DispatchQueue.main.async(execute: { [weak self]  in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        })
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PeopleModel.sharedInstance.personCount
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellId, for: indexPath)
        if let personCell = cell as? PersonTableViewCell {
            let personInfo = PeopleModel.sharedInstance.personInfos[indexPath.item]
            personCell.firstName.text = personInfo.firstName
            personCell.lastName.text = personInfo.lastName
            personCell.city.text = personInfo.city
            return personCell
        }

        return cell
    }
}
