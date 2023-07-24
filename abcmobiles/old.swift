//
//  old.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

struct roots : Codable
{
    var material : String
    var img : String
}
import UIKit
var inde = 0
var comp = ["OnePlus 7","Apple iPhone SE","Apple iPhone 11","Vivo v25 Pro 5G","OnePlus 9RT 5G","Apple iPhone 11","Apple iPhone 12","OnePlus 8T"]
var d_img = ["one 7","apple se","apple 11","vivo pro","one 9r","apple 11","apple 12","one 8"]
//var iimg = ["one","apple","apple","vivo","one","apple","apple","one"]
class old: UIViewController, UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ocell
       // cell.old_lbl.text = comp [indexPath.row]
        
        cell.old_lbl.text = json?[indexPath.row].material
        
        
        // image printing
//        let url = URL(string: json![indexPath.row].img)
//        let data = try?Data(contentsOf: url!)
//        if let imgdata = data
//        {
//            let loadimg = UIImage(data: imgdata)
//            cell.old_img.image = loadimg
//        }
        
        
        // printing image uisng if let and gourd let since error is generating
        if let urlString = json?[indexPath.row].img, let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let loadimg = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.old_img.image = loadimg
                    }
                } else {
                    // Handle the case where data cannot be fetched or loaded image is nil
                    DispatchQueue.main.async {
                        cell.old_img.image = UIImage(named: "placeholderImage") // Set a placeholder image or any other error handling
                    }
                }
            }
        } else {
            // Handle the case where the URL string is nil or the URL couldn't be created
            cell.old_img.image = UIImage(named: "placeholderImage") // Set a placeholder image or any other error handling
        }

        
        
        //cell.old_img.image = UIImage(named: iimg[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            inde = indexPath.row
            performSegue(withIdentifier: "old_segue", sender: self )
        }
    
    var json : [roots]?
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up activity indicator properties
        activityIndicator.color = .green
        activityIndicator.hidesWhenStopped = true
        
        // Add activity indicator to view hierarchy and center it
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Start animating the activity indicator
        activityIndicator.startAnimating()
        
        // Simulate a long-running task
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.activityIndicator.stopAnimating()
        }
        geetdata()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var oldtable: UITableView!
    
    func geetdata()
    {
        var url = URL(string: "https://apigenerator.dronahq.com/api/GwRWKxz3/oldmobilewithimg")
        var session = URLSession.shared.dataTask(with: url!)
        {
            (data,respone,error)in
            
            do
            {
                var content = try?JSONDecoder().decode([roots].self, from: data!)
                self.json = content
                DispatchQueue.main.async
                {
                    self.oldtable.reloadData()
                }
            }
            
            catch
            {
                
            }
            
            
        }
        session.resume()
    }
    


}
