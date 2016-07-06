//
//  PokemonCell.swift
//  pokemon
//
//  Created by Macbook  on 7/6/16.
//  Copyright © 2016 Macbook . All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var imgThumb: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon)  {
        
        self.pokemon = pokemon
        
        self.lblName.text = self.pokemon.pokeName.capitalizedString
        self.imgThumb.image = UIImage(named: "\(self.pokemon.pokeId)")
    }
}
