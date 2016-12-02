//
//  MainViewController.swift
//  WowAppTest
//
//  Created by Syafiq on 11/25/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK :- Variables
    
    var userOneImages : [UIImage] = []
    var userTwoImages : [UIImage] = []
    
    //Player 1
    
    @IBOutlet weak var userOneProfileImageView: UIImageView!
    @IBOutlet weak var userOneNameLabel: UIButton!
    @IBOutlet weak var userOneTrophyImageView: UIImageView!
    @IBOutlet weak var userOneImagesView: UIImageView!
    
    //User 2
    @IBOutlet weak var userTwoProfileImageView: UIImageView!
    
    @IBOutlet weak var userTwoNameButton: UIButton!
    @IBOutlet weak var userTwoTrophyImageView: UIImageView!
    @IBOutlet weak var userTwoImagesView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userOneProfileImageView.sd_setImage(with: URL(string:Constant.Nadal.profilePicture))
        userOneNameLabel.setTitle(Constant.Nadal.name, for: .normal)
        
        
        userOneImagesView.sd_setAnimationImages(withURLs: Constant.Nadal.images)
        
        
        userTwoProfileImageView.sd_setImage(with: URL(string:Constant.Federer.profilePicture))
        userTwoNameButton.setTitle(Constant.Federer.name, for: .normal)
        
        userTwoImagesView.sd_setAnimationImages(withURLs: Constant.Federer.images)
        

        // Do any additional setup after loading the view.
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
