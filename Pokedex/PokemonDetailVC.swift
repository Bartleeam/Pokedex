//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Bradley Rubin on 9/30/16.
//  Copyright © 2016 Bradley Rubin. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {


    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        nameLabel.text = pokemon.name.capitalized
        pokedexLbl.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetail {
            // after completed call
            self.updateUI()
        }
    }
    
    func updateUI() {
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No further evos..."
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }
    
    @IBAction func backBtnPrsd(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
