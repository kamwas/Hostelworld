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
    @IBOutlet weak var loadingImageIndicator: UIActivityIndicatorView!
    var progresHUD:MBProgressHUD?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        if self.propertyDetails == nil {
            self.progresHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            self.progresHUD?.labelText = "Loading Data"
        }
    }
    
    
    var propertyDetails:HWMProperty? {
        didSet {
            if let progres = self.progresHUD {
                progres.hide(true)
            }
            if let prop = self.propertyDetails {
                self.hostelNameLabel.text = prop.name
                self.address1Label.text = prop.address1
                self.address2Label.text = prop.address2
                self.cityLabel.text = prop.city.name
                self.countryLabel.text = prop.city.country
                self.descriptionTextField.text = prop.descrip
                self.directionTextView.text = prop.directions
                let image = (prop.images as NSArray).objectAtIndex(0) as! HWMImage
                image.getImageWithSize(HWMImageSizes.kHWMImageSizeLarge, withCompletionHandler: { (image, error) -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if let img = image {
                            self.imageView.image = img
                        }
                        self.loadingImageIndicator.stopAnimating()
                    })
                })
            }
        }
    }
    
    
    
}
