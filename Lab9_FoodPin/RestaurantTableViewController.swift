//
//  RestaurantTableViewController.swift
//  Lab9_FoodPin
//
//  Created by Slawek Kurczewski on 18.02.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl",
        "Petite  Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery",
        "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats","Waffle & Wolf",
        "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
                            "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg",
                            "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg",
                            "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg",
                            "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
                            "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
                               "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
                               "New York", "New York", "New York", "New York", "New York", "New York", "New York",
                               "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink",
         "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American",
        "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea",
        "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantPhoneNumbers = ["512-58-95-21","512-58-95-22","512-58-95-23","512-58-95-24","512-58-95-25","512-58-95-25",
                                "512-58-95-27","512-58-95-28","512-58-95-29","512-58-95-30","512-58-95-31","512-58-95-32",
                                "512-58-95-33","512-58-95-34","512-58-95-35","512-58-95-36","512-58-95-37","512-58-95-38",
                                "512-58-95-39","512-58-95-40","512-58-95-41"]
                                
    var restaurantIsVisited=Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // usunięcie napisu przy klawiszu cofania
        navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe=true
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        // ukrycie paska nawigacji podczas skrolowania tablicy w dół
        navigationController?.hidesBarsOnSwipe=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier="Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        

        cell.nameLabel.text=restaurantNames[indexPath.row]
        cell.locationLabel?.text=restaurantLocations[indexPath.row]
        cell.typeLabel?.text=restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image=UIImage(named:restaurantImages[indexPath.row])
        
        // generowanie obrazków na tle koła - clipToBoundRadius 
        //    S   dostępne też background, border, shedow, opacity
        
        cell.thumbnailImageView.layer.cornerRadius=30.0
        cell.thumbnailImageView.clipsToBounds=true
        cell.accessoryType=restaurantIsVisited[indexPath.row] ? .checkmark : .none
       
        
        return cell
    }
  
//    override    func    tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Tworzenie option menu jako action sheet - druga opcja alert
//        let optionMenu=UIAlertController(title: "Tytuł", message: "Co chcesz zrobić?", preferredStyle: .actionSheet)
//        
//        // Dodawanie Call action
//        let callActionHandler={ (action:UIAlertAction!) -> Void in
//            let allertMessage = UIAlertController(title: "Usługa niedostępna",
//                                                  message: "Przepraszam telefon niedostępny. Spróbój później",
//                                                  preferredStyle: .alert)
//            
//            allertMessage.addAction(UIAlertAction(title:"OK",style:.default,handler:nil))
//            self.present(allertMessage, animated: true, completion: nil)
//        }
//        let tytul=restaurantIsVisited[indexPath.row] ? "Odznacz" : "Zaznaczswift"
//        let checkInAction=UIAlertAction(title: tytul, style: .default, handler:
//        {
//            (action:UIAlertAction!) -> Void in
//            let cell=tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
//            self.restaurantIsVisited[indexPath.row] = !(self.restaurantIsVisited[indexPath.row])
//        })
//        
//        // Dodawanie akcji do menu
//        let  cancelAction=UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let  callAction = UIAlertAction(title: "Zadzwoń na "+"123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        
//        optionMenu.addAction(checkInAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        present(optionMenu, animated: true, completion: nil)
//        
//        
//    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    // jeśli używamy metodę editActionsForRowAt to ta metoda  jest zbędna
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
            restaurantNames.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantPhoneNumbers.remove(at: indexPath.row)
            
            // tableView.reloadData()  przeładowuje całą tablicę lepiej użyć deleteRows
            tableView.deleteRows(at: [indexPath], with: .fade) // dostępne .fade .right .left .top
        }
        print("Ilość elementów tablicy: \(restaurantNames.count)")
        for name in restaurantNames {
            print("Restauracja:"+name)
        }
    }
    override    func    tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social - klawisz udostępniania
        let shareAction=UITableViewRowAction(style: .default, title: "Share",
            handler:
            { (action, indexPath) -> Void in
                let defaultText="Właśnie sprawdzam w "+self.restaurantNames[indexPath.row]
            
                if let imagageToShare=UIImage(named: self.restaurantImages[indexPath.row])
                {
                   let activityControler=UIActivityViewController(activityItems: [defaultText,imagageToShare], applicationActivities: nil)
                   self.present(activityControler, animated: true, completion: nil)
                }
            })
        shareAction.backgroundColor=UIColor(red:0/255, green: 177/255, blue:106/255, alpha:1.0) // 48 173 99
        // Delete - klawisz kasowania
        let deleteAction = UITableViewRowAction(style: .default, title: "Kasuj",
        handler:
        { (action,indexPath)  -> Void in
            // kasowanie wierszy z tablic źródłowych - modelu
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantPhoneNumbers.remove(at: indexPath.row)
       
            //  kasowanie z widoku
            self.tableView.deleteRows(at: [indexPath], with: .fade)
                })
        deleteAction.backgroundColor=UIColor.red
        return  [deleteAction, shareAction]
        }
    // Przekazywanie obrazka z ViewControlera master do detail dla segue 'showRestaurantDetail'
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showRestaurantDetail" {
            if let indexPath=tableView.indexPathForSelectedRow
            {
                let destinationControler=segue.destination as! RestaurantDetailViewController
                destinationControler.sendImage=restaurantImages[indexPath.row]
                
                destinationControler.sendName=restaurantNames[indexPath.row]
                destinationControler.sendLocation=restaurantLocations[indexPath.row]
                destinationControler.sendType=restaurantTypes[indexPath.row]
                destinationControler.sendVisited=restaurantIsVisited[indexPath.row]
                destinationControler.sendPhone=restaurantPhoneNumbers[indexPath.row]
            }
        
        }
    }
        


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
