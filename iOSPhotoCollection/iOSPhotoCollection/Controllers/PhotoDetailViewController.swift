//
//  PhotoDetailViewController.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func savePhoto(_ sender: Any) {
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
