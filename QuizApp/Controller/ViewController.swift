//
//  ViewController.swift
//  QuizApp
//
//  Created by STAQO on 16/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTxtFld: UITextField!
    
    @IBOutlet weak var correctLbl: UILabel!
    
    @IBOutlet weak var sliderValue: UISlider!
    
   
    
    @IBOutlet weak var noOfQues: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxtFld.delegate = self
       // sliderValue.minimumValue = 5
        
    }
    func issValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z\\_]{1,18}$"
        let trimmedString = testStr.trimmingCharacters(in: .whitespaces)
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: trimmedString)
        return result
        
    }
    let step: Float = 5
    @IBAction func sliderValuer(_ sender: UISlider) {
        
//        noOfQues.text = String(format:".%f",sender.value)
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        noOfQues.text = String(format:"%.f",sender.value)
    }
    
    @IBAction func submitBtnAction(_ sender: UIButton) {
        if nameTxtFld.text?.count == 0{
            
            correctLbl.text = "Please Fill This"
            correctLbl.textColor = .red
            
        }
        else if issValidEmail(testStr: nameTxtFld.text ?? "" ) == false{
            correctLbl.text = "please fill Incorrect Name"
            correctLbl.textColor = .red
        }else {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}

//
//                let alert = UIAlertController(title: "Name", message: "Name enter is wrong", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//                present(alert, animated: true, completion: nil)
//
//            }
//
//
//        }
        
extension ViewController: UITextFieldDelegate {
            
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        UserDefaults.standard.set(textField.text, forKey: "name")
        if issValidEmail(testStr: textField.text ?? "") == true{
        correctLbl.text = "Correct"
        correctLbl.textColor = .green
    } else{
                    correctLbl.text = "Incorrect"
                    correctLbl.textColor = .red
                }
                return true
            }
            
}


        
    
    
