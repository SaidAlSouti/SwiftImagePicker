//
//  ViewController.swift
//  ImagePicker
//
//  Created by Personal on 04/09/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import YPImagePicker
class ViewController: UIViewController {

    @IBOutlet weak var imageViewer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func PickImage(_ sender: Any) {
        // https://github.com/Yummypets/YPImagePicker
        var config = YPImagePickerConfiguration()
        config.showsFilters = false
        config.onlySquareImagesFromCamera = false
        config.startOnScreen = .library
        
        config.targetImageSize = .cappedTo(size: 1048)
//        config.showsCrop = .rectangle(ratio: 2)
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                self.imageViewer.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
}

