//
//  File.swift
//  Keymate
//
//  Created by Laureen Schausberger on 16.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class AchieveCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    let reuseIdentifier = "achievementCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate var images = [UIImage]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let image = UIImage(named: "medal") {
            for _ in 0..<12 {
                self.images.append(image)
            }
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
       
        if indexPath.item == 2 || indexPath.item == 5 || indexPath.item == 6 || indexPath.item == 10 {
            cell.imageView.image = self.images[indexPath.item].image(alpha: 0.3)
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
        /*
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "popover")
        
        vc.modalPresentationStyle = .popover
        let popover = vc.popoverPresentationController!
        popover.delegate = self
        popover.permittedArrowDirections = .up
        popover.sourceView = sender as? UIView
        popover.sourceRect = sender.bounds
        
        present(vc, animated: true, completion:nil)
 */
        
    }
 
}


class AchieveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
}
