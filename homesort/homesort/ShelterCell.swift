//
//  ShelterCell.swift
//  homesort
//
//  Created by Junyuan Suo on 10/22/16.
//  Copyright © 2016 JYLock. All rights reserved.
//

import UIKit

class ShelterCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var availableBedsLabel: UILabel!
    
    @IBOutlet weak var totalBedsLabel: UILabel!
    
    
    // MARK: - View Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(shelter: Shelter){
        nameLabel.text = shelter.name
        telephoneLabel.text = shelter.telephone
        addressLabel.text = shelter.address
        availableBedsLabel.text = String(shelter.availableBeds)
        totalBedsLabel.text = String(shelter.totalBeds)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
