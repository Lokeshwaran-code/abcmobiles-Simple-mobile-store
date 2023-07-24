//
//  old_details.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

import UIKit

class old_details: UIViewController {

    
    @IBOutlet var old_r_img: UIImageView!
    @IBOutlet var o_col: UILabel!
    @IBOutlet var o_cond: UILabel!
    @IBOutlet var o_sto: UILabel!
    @IBOutlet var o_ram: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        o_col.text = col[inde]
        o_cond.text = cond[inde]
        o_sto.text = storage[inde]
        o_ram.text = ram[inde]
        old_r_img.image = UIImage(named: d_img[inde])
        
        // Do any additional setup after loading the view.
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
