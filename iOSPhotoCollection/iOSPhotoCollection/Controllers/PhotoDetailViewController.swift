//
//  PhotoDetailViewController.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let image = imageView.image,
            let imageData = UIImagePNGRepresentation(image),
            let title = textField.text else { return }
        if photo == nil {
            photoController?.createPhoto(withImage: imageData, title: title)
        } else {
            guard let photo = photo else { return }
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else { return }
                if status == .authorized {
                    self.presentImagePickerController() } }
        default:
            let alert = UIAlertController(title: "Permission Required", message: "Photo Collection neds access to your photos. Please enable access in Settings > Apps > Photo Collection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                NSLog("The \"Change permsissions in Settings\" alert occurred.")
            }))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setTheme() {
        guard let current = themeHelper?.themePreference else { return }
        if current == "Dark" {
            self.view?.backgroundColor = .lightGray
        } else {
            self.view?.backgroundColor = .white
        }
    }
    
    func updateViews() {
        if photo != nil {
            guard let imageData = photo?.imageData,
                let image = UIImage(data: imageData),
                let title = photo?.title else { return }
            imageView.image = image
            textField.text = title
        } else {
            return
        }
    }
    
    func presentImagePickerController() {
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        } else { return }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
    }
}
