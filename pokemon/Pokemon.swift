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
    private var _pokeId: String!
    
    
    var pokeName: String{
        
        return _pokeName
    }
    
    var pokeId: String{
        
        return _pokeId
    }
    
    init(pokeName: String, pokeId: String){
        
        self._pokeName = pokeName
        self._pokeId = pokeId
    }
    
}