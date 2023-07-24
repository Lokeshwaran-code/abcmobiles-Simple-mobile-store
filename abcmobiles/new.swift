//
//  new.swift
//  abcmobiles
//
//  Created by LOKESH on 05/07/23.
//

struct root : Codable
{
    var material : String?
    var img : String?
}

import UIKit

var myindex = 0

var hereimg = ["apple","sam","vivo","one","iq","nokia","oppo","google","poco"]
var brand = ["Apple","Samsung","Vivo","One Plus","Iqoo","Nokia","Oppo","Goolge","Poco"]
var col = ["Red","Black","Grey","Red","Black","Grey","Red","Black","Grey"]
var cond = ["Good","Fair","Fair","Good","Fair","Fair","Good","Fair","Fair"]
var storage = ["256GB","128GB","64GB","256GB","128GB","256GB","128GB","128GB","128GB"]
var ram = ["6GB","8GB","6GB","3GB","16GB","6GB","8GB","12GB","6GB"]



var new_img = ["13 mini","sss","vivi","ooo","iqq","nnn","opop","ggg","ppp"]
var info = ["apple_info","sam_info","vivo_info","one_info","iq_info","nokia_info","oppo_info","goo_info","poco_info"]

class new: UIViewController,UITableViewDelegate,UITableViewDataSource


{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ncell
        //cell.nlbl?.text = brand[indexPath.row]
        // printing img with array
        //cell.pimg?.image = UIImage(named: hereimg[indexPath.row])
        
        cell.nlbl.text = json?[indexPath.row].material
        
        if let urlString = json?[indexPath.row].img, let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let loadimg = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.pimg.image = loadimg
                    }
                } else {
                    // Handle the case where data cannot be fetched or loaded image is nil
                    DispatchQueue.main.async {
                        cell.pimg.image = UIImage(named: "placeholderImage") // Set a placeholder image or any other error handling
                    }
                }
            }
        } else {
            // Handle the case where the URL string is nil or the URL couldn't be created
            cell.pimg.image = UIImage(named: "placeholderImage") // Set a placeholder image or any other error handling
        }
       
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            myindex = indexPath.row
            performSegue(withIdentifier: "segue", sender: self )
        }
    
    
    var json : [root]?
 
    @IBOutlet var newtable: UITableView!
    
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up activity indicator properties
        activityIndicator.color = .red
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
        getdata()
        // Do any additional setup after loading the view.
    }


    func getdata()
    {
        var url = URL(string:"https://apigenerator.dronahq.com/api/HSb9sL15/new_mobile_with_imgs")
        var session = URLSession.shared.dataTask(with: url!)
        {
            (data,response,error) in
            do
            {
                var content = try? JSONDecoder().decode([root].self ,from: data!)
                self.json = content
                
                DispatchQueue.main.async
                {
                    self.newtable.reloadData()
                }
            }
            catch
            {
                
            }
        }
        session.resume()
    }
}
