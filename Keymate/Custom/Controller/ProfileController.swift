//
//  OverviewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 01.03.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProfileController: BaseTableViewController, NSFetchedResultsControllerDelegate {

    let cdManager: CoreDataManager = CoreDataManager.sharedInstance
    var keys: [Key] = []
    var sorted: [Key] = []
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileBackground: UIImageView!
    @IBOutlet weak var profileBackgroundLayer: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileHighscore: UILabel!
    @IBOutlet weak var profileHighscoreLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var task: UILabel!
    @IBOutlet weak var games: UILabel!
    @IBOutlet weak var events: UILabel!
    @IBOutlet weak var achievements: UILabel!
    var context = CIContext(options: nil)
    
    override func viewDidLoad() {
        if let image = UIImage(named: "profile") {
            self.profilePicture.image =     image
            self.profileBackground.image =  image
        }
        self.profileHighscore.layer.zPosition =         3
        self.profileHighscoreLabel.layer.zPosition =    3
        self.profilePicture.layer.zPosition =           2
        self.profileBackgroundLayer.layer.zPosition =   1
        self.profileHighscore.textColor = UIColor.keymateOrange
        self.blurEffect(for: self.profileBackground)
        self.changeToCircle(view: self.profilePicture)
        
        self.updateHighscore()
    }
    
    private func updateHighscore() {
        if let highscore = UserDefaults.standard.value(forKey: "highscore") {
            self.profileHighscore.text = String(describing: highscore)
        }
    }
    
    private func changeToCircle(view: UIImageView) {
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
    }
    
    private func blurEffect(for image: UIImageView) {
        
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: image.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(5, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        self.profileBackground.image = processedImage
    }
    
        /*
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateObjects),
            name: Notification.Name.NSManagedObjectContextDidSave,
            object: nil
        )
        self.updateViewData()
 
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateViewData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "overViewCell", for: indexPath)
        let key = Array(sorted)[indexPath.row]
        
        
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        let nameLabel: UILabel = cell.viewWithTag(2) as! UILabel
        let catLabel: UILabel = cell.viewWithTag(3) as! UILabel
    
        nameLabel.text = key.name
        catLabel.text = key.category
        
        if key.category == "Login" {
            imageView.image = UIImage(named: "medal")
        }
        if key.category == "Bankaccount" {
            imageView.image = UIImage(named: "medal")
        }
        if key.category == "Personal" {
            imageView.image = UIImage(named: "medal")
        }
        if key.category == "Other" {
            imageView.image = UIImage(named: "medal")
        }
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            let viewcontroller = segue.destination as! DetailKeyViewController
            viewcontroller.key = Array(sorted)[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    // MARK: DataSource
    func updateObjects(notification: Notification) {
        self.fetchedResultsController.managedObjectContext.mergeChanges(fromContextDidSave: notification)
        updateViewData()
        self.updateViewData()
        self.tableView.reloadData()
    }
    
    func updateViewData() {
        keys = Key.fetchInContext(cdManager.managedObjectContext)
        if keys != nil {
            sorted = keys.sorted { $0.name! < $1.name! }
        }
        
    }
    
    // - MARK: NSFetchedResultController
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Key> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Key> = Key.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "abc", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.sharedInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    // MARK: Fetched Results Controller Delegate Methods
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath as IndexPath], with: .fade)
                print("got something")
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            }
            break
            
        default:
            break
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = self.tableView.cellForRow(at: indexPath)
            let label = cell?.viewWithTag(2) as! UILabel
            if let name = label.text {
                var i = 0
                for key in sorted {
                    i += 1
                    if key.name == name {
                        if i == 1 {
                            sorted.removeFirst()
                        } else {
                            sorted.remove(at: i)
                        }
                        _ = Key.delete(key: key, in: CoreDataManager.sharedInstance.managedObjectContext)
                        self.updateViewData()
                    }
                }
            }
        }
    }
 
 */
}
