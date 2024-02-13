//
//  ResultsViewController.swift
//  MediaFinder
//
//  Created by Tyler Averette on 2/12/24.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var lblMediaTitle: UILabel!
    
    var myMedia: [MediaInfo] = []
    var selection = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMedia[selection].platforms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        lblMediaTitle.text = myMedia[selection].title
        content.text = myMedia[selection].platforms[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    @IBAction func backToMainWasPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
