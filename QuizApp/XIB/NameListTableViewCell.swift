//
//  NameListTableViewCell.swift
//  QuizApp
//
//  Created by STAQO on 17/11/22.
//

import UIKit

class NameListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTotalScore: UILabel!
    @IBOutlet weak var lblTotalQues: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
