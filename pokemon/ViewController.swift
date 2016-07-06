//
//  ViewController.swift
//  pokemon
//
//  Created by Macbook  on 7/6/16.
//  Copyright © 2016 Macbook . All rights reserved.
//

import UIKit

class ViewController: UIViewController ,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let indentifier = "pokeCell"
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(indentifier, forIndexPath: indexPath) as? PokemonCell{
            
            let pokemon = Pokemon(pokeName: "POKE", pokeId: "\(indexPath.row)")
        
            cell.configureCell(pokemon)
            
            return cell
        }else{
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
   }

