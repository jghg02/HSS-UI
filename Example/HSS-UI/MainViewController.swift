//
//  MainViewController.swift
//  HSS-UI_Example
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import HSS_UI

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let routes: [String: UIViewController] = ["HSS Button": HSSButtonViewController(),
                                              "HSS Label": HSSLabelViewController(),
                                              "HSS TextField": HSSTextFieldViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HSS UI Components"
    }

}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell from the table view.
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        // Assuming you have an array that contains the keys for your 'routes' dictionary
        let keysArray = Array(routes.keys)

        // Make sure the indexPath.row is within the bounds of your keys array
        if indexPath.row < keysArray.count {
            let keyForCell = keysArray[indexPath.row]

            // Configure the cell with data from your data source.
            cell.textLabel?.text = keyForCell
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Assuming you have an array that contains the keys for your 'routes' dictionary
        let keysArray = Array(routes.keys)

        if indexPath.row < keysArray.count {
            let keyForCell = keysArray[indexPath.row]

            // Retrieve the view controller for the selected key
            if let viewControllerToPush = routes[keyForCell] {
                // Push the view controller onto the navigation stack
                self.navigationController?.pushViewController(viewControllerToPush, animated: true)
            }
        }

        // Deselect the row, if desired
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.routes.count
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

