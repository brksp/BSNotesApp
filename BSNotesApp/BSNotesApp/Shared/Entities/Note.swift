//
//  Note.swift
//  BSNotesApp
//
//  Created by Burak SIPCIKOGLU on 20/05/2017.
//  Copyright © 2017 burak. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Note: Object {
    var title: String?
    var spot: String?
    var check: CheckBox?
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
//    init(title: String, spot: String, check: CheckBox) {
//        self.title = title
//        self.spot = spot
//        self.check = check
//        super.init()
//    }
//    
//    required init() {
//        super.init()
//    }
//    
//    
//    required init(realm: RLMRealm, schema: RLMObjectSchema) {
//        fatalError("init(realm:schema:) has not been implemented")
//    }
//    
//    required init(value: Any, schema: RLMSchema) {
//        fatalError("init(value:schema:) has not been implemented")
//    }
    
}
