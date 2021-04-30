//
//  CustomTableViewCell.swift
//  SayIt-Proto1
//
//  Created by Meiselina Sundari on 29/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var questionCell: UILabel!
    @IBOutlet weak var answerCell: UITextField!
    
    var strukturQs : strucQs!
    
    func updateQs() {
        questionCell.text = strukturQs.question
        answerCell.text = strukturQs.answer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

struct strucQs {
    var question:String!
    var answer:String!
}
