//
//  PhotoController.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos : [Photo] = []
    
    func createPhoto(withImage imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        if let index = photos.index(of: photo) {
            photos[index].imageData = imageData
            photos[index].title = title
        }
    }
}
