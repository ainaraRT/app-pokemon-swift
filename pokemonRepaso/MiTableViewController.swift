//
//  MiTableViewController.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import UIKit

class MiTableViewController: UITableViewController {
    
    var pokemons: [Pokemon?] = []
    var images: [UIImage?] = []
    let MAX_POKEMONS = 50
    var imagesDownload = 0
    var connection = Connection()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Pokemons"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pokemons = [Pokemon?](repeating: nil, count: MAX_POKEMONS)
        images = [UIImage?](repeating: nil, count: MAX_POKEMONS)
        
        downloadPokemonsInfo()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPokemonCell", for: indexPath) as! MyCell

        // Configure the cell...
        //mostrar activity antes de cargar todos los pokemons
        if cell.activityPokemon.isAnimating {
            cell.nameCell.isHidden = true
            cell.imageCell.isHidden = true
        } else {
            cell.nameCell.isHidden = false
            cell.imageCell.isHidden = false
        }
        
        if let pokemon = pokemons[indexPath.row] {
            cell.nameCell.font = UIFont(name: "Pokemon Solid", size: 20)
            cell.nameCell.text = pokemon.name?.capitalized ?? "Desconocido"
            cell.nameCell.textColor = .red
        }
        
        if let image = images [indexPath.row] {
            cell.imageCell.image = image
            cell.activityPokemon.stopAnimating()
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func downloadPokemonsInfo() {
        for i in 1...MAX_POKEMONS {
            connection.getPokemon(withId: i) { pokemon in
                if let pokemon = pokemon, let id = pokemon.id {
                    self.pokemons[id - 1] = pokemon
                    //obtenemos la imagen
                    if let image = pokemon.sprites?.frontDefault {
                        self.connection.getSprite(withURLString: image) { image in
                            self.imagesDownload = self.imagesDownload + 1
                            if let image = image {
                                self.images[id - 1] = image
                            }
                            if self.imagesDownload == self.MAX_POKEMONS {
                                DispatchQueue.main.async {
                                    //Una vez descargadas las imágenes lanzamos el refresco de la tabla
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}
