//
//  SearchResultsVC.swift
//  homesort
//
//  Created by Junyuan Suo on 10/22/16.
//  Copyright © 2016 JYLock. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var shelters = [Shelter]()
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shelter = Shelter(shelters[indexPath.row])
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShelterCell") as? ShelterCell {
            
            cell.configureCell(shelter: shelter)
            return cell
        } else {
            return ShelterCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let shelter = Shelter(shelters[indexPath.row])
//        self.performSegueWithIdentifier(Storyboard.movieDetailIdentifier, sender: shelter)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
