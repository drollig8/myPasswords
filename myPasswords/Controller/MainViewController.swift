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
        let tableFrame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60)
        tableView = UITableView(frame: tableFrame, style: .Grouped)
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
            print("ViewDidLoad: Dropbox is linked.")
            bbiConnect.title = "Disconnect"
            initDropboxRestClient()
           
        } else {
            linkToDropBox()
        }
    }
    
    
    func tryToReadOurDataFileFromDropBox()
    {
        let entryPathURL = entryManager.entryPathURL
        
        let uploadFilename = entryPathURL.lastPathComponent
        let destinationPath = "".stringByAppendingString(uploadFilename!)
        let sourcePath = entryPathURL.path
        print("Trying to load database from dopbox. If not successfull we will use existing one...")
        self.dbRestClient.loadFile(destinationPath, intoPath: sourcePath)
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
        print("Saving entries and uploading to dropbox")
        let entryPathURL = entryManager.entryPathURL
        entryManager.save()
        
        let uploadFilename = entryPathURL.lastPathComponent
        let destinationPath = "/"
        let sourcePath = entryPathURL.path
        self.dbRestClient.uploadFile(uploadFilename, toPath: destinationPath, withParentRev: nil, fromPath: sourcePath)

    }

    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
         tryToReadOurDataFileFromDropBox()
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
    }
    
    @IBAction func connectToDropbox(sender: AnyObject)
    {
        if !DBSession.sharedSession().isLinked() {
            linkToDropBox()
        }
        else {
            unlinkFromDropBox()
        }
    }
    
    func linkToDropBox()
    {
        DBSession.sharedSession().linkFromController(self)
    }
    
    func unlinkFromDropBox()
    {
        DBSession.sharedSession().unlinkAll()
        bbiConnect.title = "Connect"
        dbRestClient = nil
    }
    
    // MARK: Dropbox Delegate Methods
    
    func restClient(client: DBRestClient!, loadedFile destPath: String!) {
        print("The file has been down loaded.")
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
