//
//  ViewController.swift
//  MultiLingualSupportIntegration
//
//  Created by Admin on 04/08/16.
//  Copyright © 2016 Anush. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var SelectLanguageLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var languageList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        languageList.removeAllObjects()
        languageList.addObject("english")
        languageList.addObject("hindi")
        languageList.addObject("marathi")

    }
    func setUpUIElements()
    {
        SelectLanguageLabel.text = MultiLanguage.languageString("selectLanguage")
        
        tableView.reloadData()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Tableview Delage methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return languageList.count
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as UITableViewCell?
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        
        cell!.textLabel?.multiLanguageKey = languageList[indexPath.row] as? String
        cell!.textLabel!.textColor = UIColor.blackColor()
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if(indexPath.row == 0)
        {
            MultiLanguage.sharedInstance.userSelectedLanguage = "en"
        }
        else if(indexPath.row == 1)
        {
            MultiLanguage.sharedInstance.userSelectedLanguage = "hi"
        }
        else if(indexPath.row == 2)
        {
            MultiLanguage.sharedInstance.userSelectedLanguage = "mr"
        }
    
        self.setUpUIElements()
        performSegueWithIdentifier("MySegue", sender: self)
    }

}

