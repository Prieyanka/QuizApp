//
//  FinalData+CoreDataProperties.swift
//  QuizApp
//
//  Created by STAQO on 24/11/22.
//
//

import Foundation
import CoreData


extension FinalData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FinalData> {
        return NSFetchRequest<FinalData>(entityName: "FinalData")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: String?
    @NSManaged public var totalQuestion: String?

}

extension FinalData : Identifiable {

}
