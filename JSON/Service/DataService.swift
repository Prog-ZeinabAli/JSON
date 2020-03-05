//
//  DataService.swift
//  JSON
//
//  Created by Jude Expresspay on 05/03/2020.
//  Copyright © 2020 test1. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


typealias CompletionHandler = (_ Success: Bool) -> ()
let API_URL = "http://blog-api.turathalanbiaa.com/api/cat"


class DataService {
    
    static let instance = DataService()
    var categories =  [Category]()
    
    
    
    func fetchAllCategories(completion: @escaping CompletionHandler){
        Alamofire.request(API_URL).responseJSON { response in
            if response.error == nil {
                
                guard let data = response.data else { return }
                do {
                    let json =  try JSON(data: data)
                    let responseCode = response.response?.statusCode
                    if responseCode == 200 {
                        self.clearCategories()
                        let categoryArray:[JSON] = json.arrayValue
                        for category in categoryArray {
                            let id = category["id"].intValue
                            let categoryName = category["name"].stringValue
                            
                            let category = Category(categoryName: categoryName, id: id)
                            self.categories.append(category)
                            completion(true)
                        }
                    }else{
                        completion(false)
                    }
                }catch {
                    completion(false)
                }
            }else{
                completion(false)
            }
        }
    }
    
    
    func clearCategories(){
        self.categories.removeAll()
    }
    
    
}
