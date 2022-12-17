//
//  DatabaseHelper.swift
//  QuizApp
//
//  Created by STAQO on 24/11/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var nameArray=[NSManagedObject]()

    func saveObject(object:[String:String]){
        print(object)
//        score totalQuestion
        let finalData = NSEntityDescription.insertNewObject(forEntityName: "FinalData", into: context!) as! FinalData
        finalData.name = object["name"]
        finalData.score = object["score"]
        finalData.totalQuestion = object["totalQuestion"]
        print(finalData)
        do {
            try context?.save()
        }catch{
            print("data is not save")
        }
    }
    func returnData()->[NSManagedObject]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FinalData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context?.fetch(request)
            nameArray=result as! [NSManagedObject]
            print(nameArray)
            return nameArray
        } catch {
            
            print("Failed")
        }
        return nameArray
    }
}
