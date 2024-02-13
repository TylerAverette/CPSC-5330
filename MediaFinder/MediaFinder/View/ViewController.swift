//
//  ViewController.swift
//  MediaFinder
//
//  Created by Tyler Averette on 2/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myMedia: [MediaInfo] = []
    var selection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMedia = MediaInfo.addSampleData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMedia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = myMedia[indexPath.row].title
        content.secondaryText = myMedia[indexPath.row].platformsToString(element: myMedia[indexPath.row])
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection = indexPath.row
        performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue" {
            let target = segue.destination as! ResultsViewController
            target.myMedia = myMedia
            target.selection = selection
        }
    }
}

