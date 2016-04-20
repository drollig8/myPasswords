//
//  EntryListViewController.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController, DBRestClientDelegate
{

    var tableView: UITableView!
    var dataprovider: EntryListDataProvider!
    var entryManager = EntryManager()
    
    // Dropbox
    var bbiConnect: UIBarButtonItem!
    var dbRestClient: DBRestClient!
    
    override func viewDidLoad()
    {
        let frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60)
        tableView = UITableView(frame: frame, style: .Grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = dataprovider
        tableView.delegate = dataprovider
        tableView.registerClass(EntryCell.classForCoder(), forCellReuseIdentifier: "Cell")
        dataprovider.entryManager = entryManager
        
        
        // not tested
        navigationController?.toolbarHidden = false
        var items = [UIBarButtonItem]()
        let syncButton = UIBarButtonItem(title: "Sync", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(copyLocalFileToDropBox))
        items.append(syncButton)
        toolbarItems = items
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addEntry(_:)))

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showDetail(_:)), name: kEntrySelectedNotification, object: nil)
        
        bbiConnect = UIBarButtonItem(title: "Connect", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(connectToDropbox(_:)))
        navigationItem.leftBarButtonItem = bbiConnect
        
        // handle notification 
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleDidLinkNotification:", name: "didLinkToDropboxAccountNotification", object: nil)
        
        // not tested: We will save on a notivifcaion
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "copyLocalFileToDropBox", name: "fileReadyForUploadToDropBox", object: nil)
        
        if DBSession.sharedSession().isLinked() {
            bbiConnect.title = "Disconnect"
            initDropboxRestClient()
        } else {
            bbiConnect.title = "Connect"
        }
    }
    
    func handleDidLinkNotification(notification: NSNotification) {
        print("handleDidLinkNotification received.")
        initDropboxRestClient()
        bbiConnect.title = "Disconnect"
    }
    
    func initDropboxRestClient() {
        dbRestClient = DBRestClient(session: DBSession.sharedSession())
        dbRestClient.delegate = self
    }
    
    func copyLocalFileToDropBox() {
        let entryPathURL = entryManager.entryPathURL
        entryManager.save()
        let nsEntryItems = NSArray(contentsOfURL: entryPathURL)
        
        //let uploadFilename = entryPathURL.lastPathComponent
 
        
        let uploadFilename = "testtext.txt"
        let sourcePath = NSBundle.mainBundle().pathForResource("testtext", ofType: "txt")
        print(sourcePath)
        let destinationPath = "/"
        
 
        
        
        let sourcePath1 = "file:///Users/marcfelden/Library/Developer/CoreSimulator/Devices/FCB1A8BD-1AFD-4F7A-9674-2C81BCF5C483/data/Containers/Data/Application/5D87A533-0DD6-42DD-A439-F5E8C7167990/Documents/"
        
        let source = entryPathURL.path
        
        self.dbRestClient.uploadFile(uploadFilename, toPath: destinationPath, withParentRev: nil, fromPath: source)

    }

    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        setTitle()
    }
    
    func setTitle()
    {
        self.title = ""
        if entryManager.entriesCount > 0 {
            self.title = "\(self.entryManager.entriesCount)"
        }
        
    }
    func addEntry(sender: AnyObject)
    {
        let addEntryViewController = AddEntryViewController()
        addEntryViewController.entryManager = entryManager
        
        let navigationController = UINavigationController(rootViewController: addEntryViewController)
        presentViewController(navigationController, animated: true, completion: nil)
        
    
    }

    func showDetail(sender:NSNotification)
    {
        let showDetailViewControll =  DetailViewController()
        if let userInfo = sender.userInfo {
            print(userInfo["indexPath"])
            if let indexPath = userInfo["indexPath"] as? NSIndexPath {
                print(entryManager.entriesCount)
                showDetailViewControll.entry = entryManager.entryAtIndexPath(indexPath)
                navigationController?.pushViewController(showDetailViewControll, animated: true)
            } else {
                fatalError("indexPatherror")
            } 
            
        }
       //
        
        
    }
    
    // MARK: Dropbox Delegate Methods
    
    @IBAction func connectToDropbox(sender: AnyObject) {
        if !DBSession.sharedSession().isLinked() {
            DBSession.sharedSession().linkFromController(self)
        }
        else {
            DBSession.sharedSession().unlinkAll()
            bbiConnect.title = "Connect"
            dbRestClient = nil
        }
    }
    
    func restClient(client: DBRestClient!, uploadedFile destPath: String!, from srcPath: String!, metadata: DBMetadata!) {
        print("The file has been uploaded.")
        print(metadata.path)
    }
    
    func restClient(client: DBRestClient!, uploadFileFailedWithError error: NSError!) {
        print("File upload failed.")
        print(error.description)
    }
    
    
}
