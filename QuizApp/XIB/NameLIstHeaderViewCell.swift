//
//  NameLIstHeaderViewCell.swift
//  QuizApp
//
//  Created by STAQO on 17/11/22.
//

import UIKit
protocol headerDelegate
{

    func backToHome()
}
class NameLIstHeaderViewCell: UITableViewCell {

    
    @IBOutlet weak var backBtn: UIButton!
    
    var delegate: headerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.delegate?.backToHome()
        
    }
}
