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
    UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemons = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        parseCSVFile()
        initAudio()
    }
    
    
    func initAudio()  {
        
        let path = NSBundle.mainBundle().pathForResource("pikachu", ofType: "mp3")
        
        do{
            
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 1
            musicPlayer.play()
            
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
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let indentifier = "pokeCell"
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(indentifier, forIndexPath: indexPath) as? PokemonCell{
            
            cell.configureCell(pokemons[indexPath.row])
            return cell
        }else{
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
   }

