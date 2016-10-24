//
//  FirstViewController.swift
//  Rainy
//
//  Created by Alex on 17.10.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import UIKit


class CurrentViewController: UIViewController {
    
    //baseURL:string,
    //params:NSDictionary
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        //let postString = ["X-API-KEY": "7570cff0a5cccf9822a50d2d0321be0f"]
        let data = "X-API-KEY=7570cff0a5cccf9822a50d2d0321be0f".data(using: String.Encoding.utf8)
        
        var request = URLRequest(url: URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London")!)
        request.httpMethod = "POST"
        request.httpBody = data
        
        let session = URLSession.shared
        
        session.dataTask(with: request) {
            data, response, err in print("Entered the completionHandler")
            }.resume()
        */
        
       // /*
        let myUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        //let postString = "X-API-KEY:7570cff0a5cccf9822a50d2d0321be0f";
        //let postString = ["X-API-KEY": "7570cff0a5cccf9822a50d2d0321be0f"];
    
        
        let data = "X-API-KEY:7570cff0a5cccf9822a50d2d0321be0f".data(using: String.Encoding.utf8)
        //request.httpBody = JSONSerialization.dataWithJSONObject(postString, options: nil, error: error)
   
        
        //request.httpBody = postString.data(using: String.Encoding.utf8);
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("response = \(response)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    // Now we can access value of First Name by its key
                    let firstNameValue = parseJSON["firstName"] as? String
                    print("firstNameValue: \(firstNameValue)")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        //*/
        //currentWearthrTemperature
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



func loadedData(data:NSData!,response:URLResponse!,err:NSError!){
    if(err != nil){
        print(err?.description)
    }else{
        //var jsonResult: NSDictionary = JSONSerialization.JSONObjectWithData(data, options: JSONSerialization.ReadingOptions.MutableContainers, error: nil) as NSDictionary
        //print(jsonResult)
        
    }
    
}

//@IBAction func sendButtonTapped(sender: AnyObject) {
 
    
//}
