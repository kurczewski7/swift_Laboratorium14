//
//  RestaurantDetailViewController.swift
//  Lab10_FoodPinAlert
//
//  Created by Slawek Kurczewski on 22.02.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    var sendImage = ""
    var sendName = ""
    var sendLocation = ""
    var sendType = ""
    
    @IBOutlet var restaurantImageView:UIImageView!    
//    @IBOutlet weak var restaurantName: UILabel!
//    @IBOutlet weak var restaurantLocation: UILabel!
//    @IBOutlet weak var restaurantType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image=UIImage(named: sendImage)
//        restaurantName.text=sendName
//        restaurantLocation.text=sendLocation
//        restaurantType.text=sendType
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
