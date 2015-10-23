//
//  ViewController.swift
//  mailbox
//
//  Created by Shunan Zhang on 10/21/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mailboxScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mailboxScrollView.contentSize = CGSize(width: 320, height: 1202)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

