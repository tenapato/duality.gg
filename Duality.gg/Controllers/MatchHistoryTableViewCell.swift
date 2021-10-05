//
//  MatchHistoryTableViewCell.swift
//  Duality.gg
//
//  Created by user189106 on 10/4/21.
//

import UIKit

class MatchHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var assistsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var roundsWinLabel: UILabel!
    @IBOutlet weak var roundsLostLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func update(with match: Match){
        killsLabel.text = String(match.kills)
        deathsLabel.text = String(match.deaths)
        assistsLabel.text = String(match.assists)
        scoreLabel.text = String(match.score)
        if match.won {
            stateLabel.textColor = UIColor.green
            stateLabel.text = "Victory"
            imageLabel.image = UIImage(named: "Victory_green.png")
        
        }else{
            stateLabel.textColor = UIColor.red
            stateLabel.text = "Defeat"
            imageLabel.image = UIImage(named: "Defeat_red.png")
        }
        roundsWinLabel.text = String(match.roundsWon)
        roundsLostLabel.text = String(match.roundsPlayed - match.roundsWon)
    
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0))
    }
    
}
