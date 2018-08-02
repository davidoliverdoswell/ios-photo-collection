//
//  PhotosCollectionViewCell.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    func updateViews() {
        
    }
    
}
