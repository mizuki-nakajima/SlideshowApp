//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Nakajima Mizuki on 2019/03/06.
//  Copyright © 2019 Nakajima Mizuki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {


    @IBOutlet weak var ResultView: UIImageView!
    var viewerImg: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ResultView.image = viewerImg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
