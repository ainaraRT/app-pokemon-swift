//
//  MyCell.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import UIKit
/*
protocol MyCellDelegate {
    func callPressed(name:String)
}*/

class MyCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var activityPokemon: UIActivityIndicatorView!
    //var delegate: MyCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
