//
//  ViewController.swift
//  JSON
//
//  Created by test1 on 3/3/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var butoon: UIButton!
    @IBOutlet weak var tv: UITableView!
    
    struct cat : Codable{
        
        let id :NSInteger
        let name:String?
       
    }

    var category = [cat]()
    
    //defining the API URL
    let API_URL = "http://blog-api.turathalanbiaa.com/api/cat"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // parsing json
        Alamofire.request(API_URL).responseJSON { response in
            let json = response.data
            
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                
                //using the array to put values
                self.category = try decoder.decode([cat].self, from: json!)
                
                //printing all the category names
                for hero in self.category{
                    print(hero.name!)
                }
           
            }catch let err{
                print(err)
            }
        }

    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //here ill start making a drop down list
    
    
    @IBAction func buttonIsPressed(_ sender: Any) {
    }
    

}//dont delete this its the end of the control view


extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row]
        return cell
        
}

           
        

        
        
     
    
    

}
