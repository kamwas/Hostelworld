//
//  ViewController.swift
//  HostelWorldDemo
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

import UIKit
import HWModel

class HWDAllPropertiesViewController: UITableViewController{
    var propertiesBasicInformation:Array<HWMPropertyBasic> = Array<HWMPropertyBasic>()
    var propertiesExtendedInfromation:Dictionary<Int,HWMProperty>  = Dictionary<Int,HWMProperty>()
    override func viewDidLoad() {
        super.viewDidLoad()
        let progress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progress.labelText = "Loading data"
        HWMServerConnection.sharedInstance.getPropertiesForDefaultCityWithCompletionHandler { properties, error in
            if let data = properties {
                self.propertiesBasicInformation = data
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    progress.hide(true);
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.propertiesBasicInformation.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let propertyBasicCellIdentifier = "PropertyBasicInformationCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(propertyBasicCellIdentifier, forIndexPath: indexPath) as! HWDPropertyBasicInformationCell
        let currentProperty = self.propertiesBasicInformation[indexPath.row]
        
        cell.propertyNameLabel.text = currentProperty.name
        cell.propertyTypeLabel.text = currentProperty.type
        cell.propertyLowestPriceLabel.text = currentProperty.lowestPricePerNight.description
        cell.propertyRaitingLabel.text = "\(currentProperty.overallRating.overall)"
        cell.tag = Int(currentProperty.id)
        let image = (currentProperty.images as NSArray).objectAtIndex(0)
        (image as! HWMImage).getImageWithSize(HWMImageSizes.kHWMImageSizeSmall) { image, error in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if cell.tag == Int(currentProperty.id) {
                    if let img = image {
                        cell.propertyImage.image = img
                    }
                    cell.loadingImageIndicator.stopAnimating()
                }
            })
        }
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            let propertyNumber = Int(self.propertiesBasicInformation[self.tableView.indexPathForSelectedRow!.row].id)
            let destinationVC = (segue.destinationViewController as! HWDPropertyViewController)
            if let property = self.propertiesExtendedInfromation[propertyNumber] {
                destinationVC.propertyDetails = property
            }else{
                HWMServerConnection.sharedInstance.getPropertyForPropertyNumber(propertyNumber, withCompletionHandler: { propertyInfo, error in
                    if let property = propertyInfo {
                        self.propertiesExtendedInfromation[propertyNumber] = property
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            destinationVC.propertyDetails = property
                        })
                        
                    }
                })
            }
        }
    }
}

