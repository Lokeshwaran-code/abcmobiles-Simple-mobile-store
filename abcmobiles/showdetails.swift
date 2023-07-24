//
//  showdetails.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

import UIKit

class showdetails: UIViewController {

    @IBOutlet var img: UIImageView!
    @IBOutlet var show_lbl: UILabel!
    @IBOutlet var cond_lbl: UILabel!
    @IBOutlet var storage_lbl: UILabel!
    @IBOutlet var ram_lbl: UILabel!
    
    @IBOutlet var info_img: UIImageView!
    
    @IBOutlet var d_view: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        show_lbl.text = col[myindex]
       // cond_lbl.text = cond[myindex]
        storage_lbl.text = storage[myindex]
        ram_lbl.text = ram[myindex]
        
        img.image = UIImage(named: new_img[myindex])
        info_img.image = UIImage(named: info[myindex])
        d_view.layer.cornerRadius = 15
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
