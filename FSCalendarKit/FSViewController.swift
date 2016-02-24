//
//  ViewController.swift
//  FacilityScheduler
//
//  Created by Paul Andrew Gutib on 10/1/15.
//  Copyright © 2015 rSchoolToday. All rights reserved.
//

import UIKit

class FSViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // show the navigation for other views
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // hide the navigation bar only for the first view
        self.navigationController?.navigationBarHidden = true
    }
    
    // MARK: Actions
    

}

