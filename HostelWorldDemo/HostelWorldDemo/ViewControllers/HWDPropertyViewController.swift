//
//  HWDPropertyViewController.swift
//  HostelWorldDemo
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

import UIKit
import HWModel

class HWDPropertyViewController: UIViewController {
    
    @IBOutlet weak var hostelNameLabel: UILabel!
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var address2Label: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var directionTextView: UITextView!
    
    var propertyDetails:HWMProperty = HWMProperty() {
        didSet {
            self.hostelNameLabel.text = propertyDetails.name
            self.address1Label.text = propertyDetails.address1
            self.address2Label.text = propertyDetails.address2
            self.cityLabel.text = propertyDetails.city.name
            self.countryLabel.text = propertyDetails.city.country
            self.descriptionTextField.text = propertyDetails.descrip
            self.directionTextView.text = propertyDetails.directions
            let image = (propertyDetails.images as NSArray).objectAtIndex(0) as! HWMImage
            image.getImageWithSize(HWMImageSizes.kHWMImageSizeLarge, withCompletionHandler: { (image, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if let img = image {
                            self.imageView.image = img
                        }
                })
            })
        }
    }
    
    
    
}
