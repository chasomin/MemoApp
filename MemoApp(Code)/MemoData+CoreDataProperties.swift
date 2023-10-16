//
//  MemoData+CoreDataProperties.swift
//  MemoApp(Code)
//
//  Created by 차소민 on 2023/10/16.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var memoContent: String?
    @NSManaged public var date: Date?
    
    
    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}

extension MemoData : Identifiable {

}
