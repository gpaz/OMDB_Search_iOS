//
//  ViewController.swift
//  OMDbSearch
//
//  Created by Galo Paz on 3/1/15.
//  Copyright (c) 2015 Galo Paz. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    let URLHostAllowedCharacterSet = NSCharacterSet(charactersInString: "\"#%/<>?@\\^`{|}")

    @IBOutlet var mSearchField: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        mSearchField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        search()
        return true
    }
    
    @IBAction func search()
    {
        let queryStr = mSearchField.text
        if(!queryStr.isEmpty)
        {
            mSearchField.enabled = false;
            performOMDbSearchOnValues(queryStr)
        }
    }
    
    func performOMDbSearchOnValues(queryStr: String)
    {
        let host = "http://www.omdbapi.com/?"
        let query = String(format: "t=%@&y=&plot=short&tomatoes=true&r=json", queryStr)
        let encoded = host + query.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string: encoded)!
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            self.onResponseReceived(response, data, error)
        }
    }
    
    func onResponseReceived(response: NSURLResponse!, _ data: NSData!, _ error: NSError!)
    {
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
        if let jsonObj = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as NSDictionary?
        {
            let omdbObj = OMDbObject(jsonDict: jsonObj)
            if omdbObj.error == nil
            {
                performSegueWithIdentifier("OMDb Query Segue", sender: omdbObj)
            }
            else
            {
                // TODO: handle error case, ie show popup, show warning message, display warning text...etc.
            }
        }
        mSearchField.enabled = true
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    {
        return sender is OMDbObject && sender != nil && identifier == "OMDb Query Segue";
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let omdbObj = sender as OMDbObject!
        let resultsController = segue.destinationViewController as QueryResultsController
        resultsController.mOMDb = sender as OMDbObject!
    }


}

