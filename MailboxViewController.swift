//
//  MailboxViewController.swift
//  mailbox
//
//  Created by Shunan Zhang on 10/22/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var listIconView: UIImageView!
    @IBOutlet weak var mailboxScrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet var messagePanRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var laterIconView: UIImageView!
    var laterIconOriginalCenter: CGPoint!
    var messageOriginalCenter: CGPoint!
    var laterVeryOriginalCenter: CGPoint!
    var messageVeryOriginalCenter: CGPoint!
    var placeholder: UIImageView!
    var listVeryOriginalCenter: CGPoint!
    var listIconOriginalCenter: CGPoint!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet var rescheduleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet var listTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var menuView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mailboxScrollView.contentSize = CGSize(width: 320, height: 1202)
        messageVeryOriginalCenter = CGPoint(x:messageView.center.x, y:messageView.center.y)
        laterVeryOriginalCenter = CGPoint(x:laterIconView.center.x, y:laterIconView.center.y)
        listVeryOriginalCenter = CGPoint(x: listIconView.center.x, y:listIconView.center.y)
        rescheduleView.alpha = 0
        listView.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rescheduleOnTap(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.rescheduleView.alpha = 0
            self.messageView.center = self.messageVeryOriginalCenter
        }

    }
    
    @IBAction func listOnTap(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.5) { () -> Void in
                self.listView.alpha = 0
                self.messageView.center = self.messageVeryOriginalCenter
        }

    }
    
    @IBAction func onEdgePan(sender: UIScreenEdgePanGestureRecognizer) {
 


    }
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        
        laterIconView.alpha = 1
        listIconView.alpha = 0
        
        print("\(laterIconView.alpha) at \(laterIconView.center)")
        
        let panLoc = messagePanRecognizer.locationInView(view)
        let panTranslation = messagePanRecognizer.translationInView(view)
        let panVelocity = messagePanRecognizer.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            listIconOriginalCenter = listIconView.center
            laterIconOriginalCenter = laterIconView.center
            messageOriginalCenter = messageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
        
            if messageView.center.x < -60 {
            
                backgroundView.backgroundColor = UIColor(red: 0.87, green: 0.72, blue: 0.53, alpha: 1)
                
                laterIconView.alpha = 0
                listIconView.alpha = 1
                
                listIconView.center = CGPointMake(listIconOriginalCenter.x + panTranslation.x + 220, listIconOriginalCenter.y)
            
           } else if messageView.center.x < 100 {
                backgroundView.backgroundColor = UIColor(red: 1, green: 0.86, blue: 0, alpha: 1)
                
                laterIconView.center = CGPointMake(laterIconOriginalCenter.x + panTranslation.x + 60, laterIconOriginalCenter.y)
            
           } else if messageView.center.x < 160 {
            
            backgroundView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
            
           } else if messageView.center.x > 370 {
            
            backgroundView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

           } else if messageView.center.x > 220 {
            
            backgroundView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            
           } else {
            
            backgroundView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
            
            }
            
            messageView.center = CGPointMake(messageOriginalCenter.x + panTranslation.x, messageOriginalCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            laterIconView.alpha = 0
            
            laterIconView.center = CGPointMake(laterVeryOriginalCenter.x, laterVeryOriginalCenter.y)
            
            if messageView.center.x < -60 {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageView.center = CGPointMake(-160, self.messageView.center.y)},
                    completion: { (Bool) -> Void in
                        
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                            self.listView.alpha = 1
                        })
                })
            } else if messageView.center.x < 100 {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.messageView.center = CGPointMake(-160, self.messageOriginalCenter.y)}, completion: { (Bool) -> Void in
                        
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                            self.rescheduleView.alpha = 1
                        })
                        
                    })
                
            } else if messageView.center.x < 220 {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageView.center = CGPointMake(self.messageVeryOriginalCenter.x, self.messageVeryOriginalCenter.y)}, completion: nil)
            } else if messageView.center.x < 370 {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageView.center = CGPointMake(480, self.messageOriginalCenter.y)}, completion: nil)
            } else {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageView.center = CGPointMake(480, self.messageOriginalCenter.y)}, completion: nil)
            }
            
            
        }


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
