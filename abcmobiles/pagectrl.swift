//
//  ViewController.swift
//  PAGEVIEW
//
//  Created by rohith suresh kumar on 16/03/23.
//

import UIKit
var gesture =  UIGestureRecognizer()

class pagectrl: UIViewController {
    var a = ["24 Hours Delivery","Purity","Market"]
    var c = ["a","b","c"]
    var b = ["Water 24 reaches you within 24 Hours","Water 24 cares your health","Water 24 is valuable for all."]
    
    
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var Skip: UIButton!
    @IBOutlet weak var bak: UIButton! //change back
    @IBOutlet weak var nxt: UIButton!
    @IBOutlet weak var done: UIButton!
    
    override func viewDidLoad() {
        
        // to hide back button
        self.navigationItem.hidesBackButton = true
        
        done.layer.cornerRadius = 15
        super.viewDidLoad()
        bak.isHidden = true
        done.isHidden = true
        page.currentPage = 0
        
        
        let Right = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        Right.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(Right)
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        left.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(left)
        
        if page.currentPage == 0{
          
            img?.image = UIImage(named: "ss1")
            
        }
//        else if page.currentPage == 1{
//            lbl1.text = a[1]
//            lbl2.text = b[1]
//            img?.image = UIImage(named: "b")
//
//
//        }
//        else if page.currentPage == 2{
//            lbl1.text = a[2]
//            lbl2.text = b[2]
//            img?.image = UIImage(named: "c")
//
//        }
    }
        @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.right:
                    if page.currentPage == 2
                    {
                        page.currentPage = 1
                        
                        img?.image = UIImage(named: "ss2")
                        done.isHidden = true
                        
                    }
                    else if page.currentPage == 1{
                        page.currentPage = 0
                       
                        img?.image = UIImage(named: "ss1")
                        bak.isHidden = true
                    }
                    
                    
                case UISwipeGestureRecognizer.Direction.left:
                    if  page.currentPage == 0{
                        page.currentPage = 1
                       
                        img?.image = UIImage(named: "ss2")
                        bak.isHidden = false
                        done.isHidden = true

                    }
                    else if page.currentPage == 1{
                        page.currentPage = 2
                      
                        img?.image = UIImage(named: "ss3")
                        bak.isHidden = false
                        done.isHidden = false
                        nxt.isHidden = true // now c
                       // Skip.isHidden = true

                    }
                    
                default:
                    break
                }
            }
        }
        // change 1
        @IBAction func backbtn(_ sender: Any) {
            if page.currentPage == 2{
                page.currentPage = 1
               
                img?.image = UIImage(named: "ss2")
                done.isHidden = true
                nxt.isHidden = false // dddd
                
            }
            else {
                page.currentPage = 0
                
                img?.image = UIImage(named: "ss1")
                bak.isHidden = true
                done.isHidden = true

                
            }
        }
    // change 2
    @IBAction func nxxbtn(_ sender: Any) {
        if page.currentPage == 0{
            page.currentPage = 1
          
            img?.image = UIImage(named: "ss2")
            bak.isHidden = false
            
        }
        else {
            page.currentPage = 2
            
            img?.image = UIImage(named: "ss3")
            bak.isHidden = false
            done.isHidden = false
            nxt.isHidden = true // now c
            
            
            
        }
    }
        @IBAction func pagecontrol(_ sender: Any) {
            
           
          
  
        }
    
    // change 3
    
    @IBAction func done(_ sender: Any)
    {
//        let b = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "tapbar") as? tapbar
//        self.navigationController?.pushViewController(b!, animated: true)
    }
    
    
    }
    



