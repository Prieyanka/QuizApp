//
//  ThirdViewController.swift
//  QuizApp
//
//  Created by STAQO on 17/11/22.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var nameOfUser: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var attemptQues: UILabel!
    @IBOutlet weak var skipQues: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOfUser.text=UserDefaults.standard.string(forKey: "name")
        attemptQues.text=String(UserDefaults.standard.integer(forKey: "attemptedQuestion"))
        skipQues.text=String(UserDefaults.standard.integer(forKey: "skipQuestion"))
        totalScore.text=UserDefaults.standard.string(forKey: "score")
    }
    

    @IBAction func btnSubmitAction(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
        vc.name = nameOfUser.text ?? ""
        vc.totalQuestion = attemptQues.text ?? ""
        vc.score = totalScore.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
