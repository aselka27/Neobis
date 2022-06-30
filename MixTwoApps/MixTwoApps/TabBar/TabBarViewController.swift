//
//  ViewController.swift
//  MixTwoApps
//
//  Created by саргашкаева on 29.06.2022.
//

import UIKit

class TabBarViewController:  UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // create instance of View Controllers
        let stopwatchVC = StopwatchViewController()
        let toDoVC = UINavigationController(rootViewController: ToDoListViewController())
        
        //set titles
        stopwatchVC.title = "ToDo"
        toDoVC.title = "Clock"
        
        //assign VCs to tabBar
        setViewControllers([stopwatchVC, toDoVC], animated: true)
        
        // set images for tabBar
        guard let items = self.tabBar.items else {return}
        let images = ["clock.arrow.2.circlepath", "scroll"]
        for i in 0...images.count-1 {
            items[i].image = UIImage(systemName: images[i])
        }
        
        //change tint color
        tabBar.tintColor = .black
        
       
    }
    
    


}

