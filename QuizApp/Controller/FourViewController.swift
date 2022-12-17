//
//  FourViewController.swift
//  QuizApp
//
//  Created by STAQO on 17/11/22.
//

import UIKit
import CoreData
 
class FourViewController: UIViewController {
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nameTableView: UITableView!
    var name = ""
    var totalQuestion = ""
    var score = ""
    var dict = ["":""]
    var databaseHelper = DatabaseHelper()
    var nameArray=[NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTableView.delegate = self
        nameTableView.dataSource = self

        nameTableView.register(UINib(nibName: "NameListTableViewCell", bundle: nil), forCellReuseIdentifier: "NameListTableViewCell")
        nameTableView.register(UINib(nibName: "NameLIstHeaderViewCell", bundle: nil), forCellReuseIdentifier: "NameLIstHeaderViewCell")
        nameTableView.register(UINib(nibName: "BackBtnTVC", bundle: nil), forCellReuseIdentifier: "BackBtnTVC")
        
        dict = ["name":name,"score":score,"totalQuestion":totalQuestion]
        databaseHelper.saveObject(object: dict)
        nameArray = databaseHelper.returnData()
        print(nameArray)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension FourViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameLIstHeaderViewCell") as! NameLIstHeaderViewCell
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameListTableViewCell", for: indexPath) as! NameListTableViewCell
            print(nameArray[indexPath.row].value(forKey: "name"),"1")
            cell.lblName.text=nameArray[indexPath.row].value(forKey: "name") as! String
            cell.lblTotalScore.text=nameArray[indexPath.row].value(forKey: "score") as! String
            cell.lblTotalQues.text=nameArray[indexPath.row].value(forKey: "totalQuestion") as! String
            return cell
    }
}

extension FourViewController: headerDelegate {
    func backToHome() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
        
