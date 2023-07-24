//
//  home.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

import UIKit
import WebKit
import SwiftyGif

class home: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == c2
        {
            return 3 // down cell
        }
        return 3 // up cell
    }
    
    
    @IBOutlet var sview: UIView!
    
    @IBOutlet var gif_img: UIImageView!

    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = c1.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! cv1
        cell.img1.image = UIImage(named: a[indexPath.row])
        
        if collectionView == c2
        {
            var cell = c2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! cv2
            cell.img2.image = UIImage(named: b[indexPath.row])
            return cell
        }
        return cell
    }
    
    var timer:Timer?
    var currentcellindex = 0
    var a = ["a1","a2","a3"]
    var b = ["b1","b2","b3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        do {
            let gif = try UIImage(gifName: "TTT")
            let imageview = UIImageView(gifImage: gif, loopCount: 500) // Will loop 3 times
            imageview.frame = gif_img.frame
            sview.addSubview(imageview)
        } catch {
            print(error)
        }
        
        
        
       // self.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: true)

        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        

        
    }
    
    @IBOutlet var c1: UICollectionView!
    @IBOutlet var c2: UICollectionView!
    
    @objc func slideToNext ()
    {
        if currentcellindex < a.count-1
        {
            currentcellindex = currentcellindex + 1
        }
        else {
            currentcellindex = 0
        }
       c1.scrollToItem(at:IndexPath(item: currentcellindex, section:0), at: .right, animated: true)
    }

  // code for gif
    
    
    

}
 
