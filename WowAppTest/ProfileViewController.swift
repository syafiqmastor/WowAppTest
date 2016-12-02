//
//  ProfileViewController.swift
//  WowAppTest
//
//  Created by Syafiq on 11/24/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import CoreImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView! {
        didSet {
            userProfileImageView.layer.shadowColor = UIColor.black.cgColor
            userProfileImageView.layer.shadowOpacity = 0.6
            userProfileImageView.layer.shadowOffset = CGSize.zero
            userProfileImageView.layer.shadowRadius = 20
            
            userProfileImageView.layer.shouldRasterize = true
        }
    }
    @IBOutlet weak var userTrophyImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userRankLabel: UILabel!
    @IBOutlet weak var userWinCountLabel: UILabel!
    @IBOutlet weak var userPencentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: Constant.Nadal.profilePicture) {
            
            userProfileImageView.sd_setImage(with: url, completed: { (image, error, cacheType, url) in
                
                guard let cgimg = image?.cgImage else {
                    print("imageView doesn't have an image!")
                    return
                }
                let openGLContext = EAGLContext(api: .openGLES2)
                let context = CIContext(eaglContext: openGLContext!)
                
                let coreImage = CIImage(cgImage: cgimg)
                
                let filter = CIFilter(name: "CISepiaTone")
                filter?.setValue(coreImage, forKey: kCIInputImageKey)
                filter?.setValue(1, forKey: kCIInputIntensityKey)
                
                if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
                    let cgimgresult = context.createCGImage(output, from: output.extent)
                    let result = UIImage(cgImage: cgimgresult!)
                    self.userProfileImageView?.image = result
                }
            })
        }
        
        userNameLabel.text = Constant.Nadal.name
        userRankLabel.text = "\(Constant.Nadal.ranking)"
        userWinCountLabel.text = "\(Constant.Nadal.winCount)"
        let winPercentage = (Constant.Nadal.winCount*100/Constant.Nadal.judgeCount)
        print(winPercentage)
        userPencentageLabel.text = "\(winPercentage)"
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
