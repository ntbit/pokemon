//
//  ViewController.swift
//  pokemon
//
//  Created by Macbook  on 7/6/16.
//  Copyright © 2016 Macbook . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
UISearchBarDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var pokemons = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    var pokemonFilter = [Pokemon]()
    var isSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.searchBar.delegate = self
        self.searchBar.returnKeyType = UIReturnKeyType.Done
        
        parseCSVFile()
        initAudio()
    }
    
    
    func initAudio()  {
        
        let path = NSBundle.mainBundle().pathForResource("pikachu", ofType: "mp3")
        
        do{
            
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            
            
        }catch let err as NSError{
            
            print(err.debugDescription)
        }
    }
    func parseCSVFile()  {
        
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do{
            
            let csv = try Csv(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
                let pokeID = Int(row["id"]!)
                let pokeName = row["identifier"]
                pokemons.append(Pokemon(pokeName: pokeName!, pokeId: pokeID!))
            }
            
            
        }catch let err as NSError{
            
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func toggleMusic(sender: UIButton!) {
        
        if musicPlayer.playing{
            musicPlayer.stop()
            sender.alpha = 1
        }else{
            musicPlayer.play()
            sender.alpha = 0.5
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let indentifier = "pokeCell"
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(indentifier, forIndexPath: indexPath) as? PokemonCell{
            
            let poke: Pokemon!
            
            if isSearchMode{
                poke = pokemonFilter[indexPath.row]
                
            }else{
                
                poke = pokemons[indexPath.row]
                
            }
            
            cell.configureCell(poke)
            return cell
        }else{
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearchMode{
            
            return pokemonFilter.count
        }else{
            return pokemons.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            
            isSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)//close keyboard
        }else{
            
            isSearchMode = true
            let lower = searchBar.text?.lowercaseString
            pokemonFilter = pokemons.filter({$0.pokeName.rangeOfString(lower!) != nil})
            collectionView.reloadData()
        }
    }
}

