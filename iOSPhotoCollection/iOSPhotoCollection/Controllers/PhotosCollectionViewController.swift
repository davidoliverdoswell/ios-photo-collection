//
//  PhotosCollectionViewController.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.textLabel.text = photo.title
        
        return cell
    }
    
    public func setTheme() {
        guard let current = themeHelper.themePreference else { return }
        if current == "Dark" {
            self.collectionView?.backgroundColor = .lightGray
        } else {
            self.collectionView?.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case "AddPhotoSegue":
            guard let vc = segue.destination as? PhotoDetailViewController
                else { return }
            vc.photoController = photoController
            vc.themeHelper = themeHelper
            
        case "ShowDetailSegue":
            guard let vc = segue.destination as? PhotoDetailViewController,
                let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
            vc.photo = photoController.photos[index]
            vc.photoController = photoController
            vc.themeHelper = themeHelper
            
        case "ThemeSelectSegue":
            guard let vc = segue.destination as? ThemeSelectionViewController else { return }
            vc.themeHelper = themeHelper
        default:
            return
        }
        
    }
       
}

