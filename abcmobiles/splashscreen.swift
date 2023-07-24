//
//  splashscreen.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

import UIKit

class splashscreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // code for gif logo
        do {
            let gif = try UIImage(gifName: "Letter")
            let imageview = UIImageView(gifImage: gif, loopCount: 20) // Will loop 3 times
            imageview.frame = logo_img.frame
            view.addSubview(imageview)
        } catch {
            print(error)
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4 )
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "pagectrl") as? pagectrl
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        
        
    }
    

    @IBOutlet var logo_img: UIImageView!
    

    
}
