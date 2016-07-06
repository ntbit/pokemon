//
//  Pokemon.swift
//  pokemon
//
//  Created by Macbook  on 7/6/16.
//  Copyright © 2016 Macbook . All rights reserved.
//

import Foundation

class Pokemon{
    
    private var _pokeName: String!
    private var _pokeId: Int!
    
    
    var pokeName: String{
        
        return _pokeName
    }
    
    var pokeId: Int{
        
        return _pokeId
    }
    
    init(pokeName: String, pokeId: Int){
        
        self._pokeName = pokeName
        self._pokeId = pokeId
    }
    
}