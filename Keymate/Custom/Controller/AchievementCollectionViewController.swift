//
//  File.swift
//  Keymate
//
//  Created by Laureen Schausberger on 16.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit
import Popover

class AchieveCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var background: UIImageView!
    
    var reuseIdentifier: String     = "achievementCell"
    let sectionInsets               = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    
    var images: [UIImage]           = [ UIImage(named: "medal")!,
                                        UIImage(named: "medalFirstAttendance")!,
                                        UIImage(named: "medal5xAttendance")!,
                                        UIImage(named: "medal10xAttendance")!,
                                        UIImage(named: "medalScoreOf50")!,
                                        UIImage(named: "medalScoreOf100")!]
    
    var information: [String]       = [ "Registration",
                                        "1st Event",
                                        "5 Events",
                                        "10 Events",
                                        "Score 50",
                                        "Score 100"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.collectionview.layer.zPosition = 2
        self.background.layer.zPosition     = 1
        self.collectionview.backgroundView?.alpha = CGFloat(0)

        
        for index in 0..<6 {
            self.images.append(self.images[index])
            self.information.append(self.information[index])
        }
        
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
 
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AchieveCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
       
        if indexPath.item == 1 || indexPath.item == 5 || indexPath.item == 6 || indexPath.item == 7 || indexPath.item == 5 || indexPath.item == 9 || indexPath.item == 10 || indexPath.item == 11 {
            cell.imageView.image = self.images[indexPath.item].image(alpha: 0.1)
        }
        else {
            cell.imageView.image = self.images[indexPath.item]
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        //let aView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        let labelEventname = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: 50))
        labelEventname.text = self.information[indexPath.row]
        labelEventname.textAlignment = .center
        //aView.add
        
        var options = [
            .animationIn(0.3),
            .arrowSize(CGSize.init(width: 15, height: 10))
            ] as [PopoverOption]
        
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            if cell.frame.origin.y < CGFloat(300) {
                options.append(.type(.down))
            }
            else {
                options.append(.type(.up))
            }
            let popover = Popover(options: options)
            
            popover.show(labelEventname, fromView: cell)
        }
    
        
        
       
        
        
    }
 
}


class AchieveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
 
}
