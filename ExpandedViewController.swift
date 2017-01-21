//
//  ExpandedViewController.swift
//  SlideshowApp
//
//  Created by 梶文乃 on 2017/01/21.
//  Copyright © 2017年 ayano.kaji. All rights reserved.
//

import UIKit

class ExpandedViewController: UIViewController {

    @IBOutlet weak var expandedimageView: UIImageView!
    
     var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        expandedimageView.image = UIImage(named: name)
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
