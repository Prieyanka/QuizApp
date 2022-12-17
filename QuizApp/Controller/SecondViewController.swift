//
//  SecondViewController.swift
//  QuizApp
//
//  Created by STAQO on 17/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var scorelbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var noOfQLbl: UILabel!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBtn: UIButton!
    
    @IBOutlet weak var falseBtn:
    UIButton!
    @IBOutlet weak var btnCommon: UIButton!
    
    var score = 0
    var questionAttempted = 0
    var ques = [String]()
    var counter = 0
    var count = 0
    var scoreTracker=0,skipQ=0,attQ=0,qNum=1
    var timer = Timer()
    var ans = [Bool]()
    var endSize=0
    var t:Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.trackTintColor = .black
        progressBar.tintColor = .blue
        progressBar.progress = Float(0) / Float(ques.count)
        setupTimer()
        ques=["2+2=5","2+2=4","3+4=7","4*3=12","3*3=4","5+5=11"]
        ans=[false,true,true,true,false,false]
        noOfQLbl.text = "\(count + 1)"
        questionLbl.text = ques[0]
        counter = 1
    }
    
    func setupTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires() {
        timeLbl.text = "Timer: \(counter)"
        if counter == 20 {
            skipQ += 1
            count += 1
            counter = 0
            progressBar.progress = Float(count) / Float(ques.count)

            if ques.count == count{
                count = 0
                timer.invalidate()
                progressBar.progress = Float(count) / Float(ques.count)
                UserDefaults.standard.set(String(score), forKey: "score")
                UserDefaults.standard.set(questionAttempted, forKey: "attemptedQuestion")
                UserDefaults.standard.set(count, forKey: "noOfQues")
                UserDefaults.standard.set(skipQ, forKey: "skipQuestion")
                noOfQLbl.text=String(qNum)
                scorelbl.text=String(scoreTracker)
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            questionLbl.text = ques[count]
            noOfQLbl.text = "\(count + 1)"
        }
        counter+=1
    }
    @IBAction func btnCommon(_ sender: UIButton) {
        questionAttempted += 1
        if sender.currentTitle == "True"{
            if ans[count] != false{
                score += 1
            }
        }else{
            
            if ans[count] != true{
                score += 1
            }
        }
        progressBar.progress=Float(count)/Float(ques.count)
        count += 1
        
        scorelbl.text = "Score:\(score)"
        if ques.count == count{
            count = 0
            progressBar.progress = Float(count) / Float(ques.count)
            UserDefaults.standard.set(String(score), forKey: "score")
            UserDefaults.standard.set(questionAttempted, forKey: "attemptedQuestion")
            UserDefaults.standard.set(count, forKey: "noOfQues")
            UserDefaults.standard.set(skipQ, forKey: "skipQuestion")
            noOfQLbl.text=String(qNum)
            scorelbl.text=String(scoreTracker)
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            self.navigationController?.pushViewController(vc, animated: true)
          
        }
        questionLbl.text = ques[count]
        noOfQLbl.text = "\(count)"
    }
}


    
    
    
    

