//
//  RestaurantDetailViewController.swift
//  Lab10_FoodPinAlert
//
//  Created by Slawek Kurczewski on 22.02.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var sendImage = ""
    var sendName = ""
    var sendLocation = ""
    var sendType = ""
    var sendVisited = false
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image=UIImage(named: sendImage)
        title=sendName
        
        // ustawienie koloru tableView
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.9)
        
        // usuniecie ramki z tableView
        tableView.tableFooterView=UIView(frame: CGRect.zero)
        
        // zmiana koloru separatora komórek
        tableView.separatorColor=UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
    
        
        
        
        // nie ma funkcji apparance().barTintColor
        //UINavigationBar.appearance().backgroundColor=UIColor(red: 216/255, green: 74/255, blue: 32/255, alpha: 1)

        
      //navigationItem.backBarButtonItem=UIBarButtonItem(title: "aaa", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text="Nazwa:"
            cell.valueLabel.text=sendName
        case 1:
            cell.fieldLabel.text="Typ:"
            cell.valueLabel.text=sendType
        case 2:
            cell.fieldLabel.text="Miejsce:"
            cell.valueLabel.text=sendLocation
        case 3:
            cell.fieldLabel.text="Znana:"
            cell.valueLabel.text = (sendVisited ? "Byłem tam" : "Nie" )
            
        default:
            cell.fieldLabel.text=""
            cell.valueLabel.text=""
        }
        // ustawienie przezroczystości komórki
        cell.backgroundColor=UIColor.clear
      return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
