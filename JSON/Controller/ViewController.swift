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
    
    
    //defining the API URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DataService.instance.fetchAllCategories { (success) in
            if success {
                self.tv.reloadData()
            }
        }
    }
    
    
    @IBAction func buttonIsPressed(_ sender: Any) {
    }
    
    
}//dont delete this its the end of the control view


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(DataService.instance.categories.count)
        return DataService.instance.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataService.instance.categories[indexPath.row].categoryName
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
}
