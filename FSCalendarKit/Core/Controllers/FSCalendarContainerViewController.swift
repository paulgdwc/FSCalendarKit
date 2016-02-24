//
//  FSCalendarContainerViewController.swift
//  FacilityScheduler
//
//  Created by Paul Andrew Gutib on 28/12/2015.
//  Copyright © 2015 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarContainerViewController: UIViewController {
    
    // TAKEN & MODIFIED FROM:
    // http://ahmedabdurrahman.com/2015/08/31/how-to-switch-view-controllers-using-segmented-control-swift/
    //

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calendarViewControl: UISegmentedControl!
    
    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
        case ThirdChildTab = 2
        case FourthChildTab = 3
    }
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("FSCalendarMonthView")
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("FSCalendarWeekView")
        return secondChildTabVC
    }()
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("FSCalendarDayView")
        return thirdChildTabVC
    }()
    lazy var fourthChildTabVC : UIViewController? = {
        let fourthChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("FSCalendarListView")
        return fourthChildTabVC
    }()
    
    @IBAction func switchCalendarView(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            
            vc.view.frame = self.containerView.bounds
            self.containerView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.SecondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.ThirdChildTab.rawValue :
            vc = thirdChildTabVC
        case TabIndex.FourthChildTab.rawValue :
            vc = fourthChildTabVC
        default:
            vc = firstChildTabVC
        }
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarViewControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(TabIndex.FirstChildTab.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // END OF COPIED CODE
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func viewingOptions(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        if calendarViewControl.selectedSegmentIndex == 0 || calendarViewControl.selectedSegmentIndex == 3 {
            vc = storyboard.instantiateViewControllerWithIdentifier("ViewingOptions3") as UIViewController
        }
        else {
            vc = storyboard.instantiateViewControllerWithIdentifier("ViewingOptions4") as UIViewController
        }
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
