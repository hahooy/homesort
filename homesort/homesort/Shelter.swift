//
//  Shelter.swift
//  homesort
//
//  Created by Junyuan Suo on 10/22/16.
//  Copyright © 2016 JYLock. All rights reserved.
//

import Foundation

class Shelter {
    private var _name: String!
    private var _address: String!
    private var _telephone: String!
    private var _totalBeds: Int!
    private var _availableBeds: Int!
    
    var name: Sring {
        return _name
    }
    
    var address: String {
        return _address
    }
    
    var telephone: String {
        return _telephone
    }
    
    var totalBeds: Int {
        return _totalBeds
    }
    
    var availableBeds: Int {
        return _availableBeds
    }
    
    init(name: String, address: String, telephone: String, totalBeds: Int, availableBeds: Int) {
        self._name = name
        self._address = address
        self._telephone = telephone
        self._totalBeds = totalBeds
        self._availableBeds = availableBeds
        
    }
    
    
    init(shelterData: Dictionary<String, AnyObject>) {
        
        if let name = shelterData["name"] as? String {
            self._name = name
        }
        
        if let address = shelterData["address"] as? String {
            self._address = address
        }
        
        if let telephone = shelterData["telephone"] as? String {
            self._telephone = telephone
        }
        
        if let totalBeds = shelterData["totalBeds"] as? String {
            self._totalBeds = totalBeds
        }
        
        if let availableBeds = shelterData["availableBeds"] as? String {
            self._availableBeds = availableBeds
        }
        
    }
    
    
}
