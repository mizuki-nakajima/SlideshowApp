//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Nakajima Mizuki on 2019/03/04.
//  Copyright © 2019 Nakajima Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    //12枚の画像に番号をつけて処理する
    // 表示している画像の番号
    var dispImageNo = 0
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 画像の名前の配列
        let imageNameArray = [
            "eto_mark01_nezumi",
            "eto_mark02_ushi",
            "eto_mark03_tora",
            "eto_mark04_usagi",
            "eto_mark05_tatsu",
            "eto_mark06_hebi",
            "eto_mark07_uma",
            "eto_mark08_hitsuji",
            "eto_mark09_saru",
            "eto_mark10_tori",
            "eto_mark11_inu",
            "eto_mark12_inoshishi",
            ]
        //最後の画像の表示時は進むで最初の画像が表示され，最初の画像の表示時は戻るボタンで最後の画像が表示
        if dispImageNo < 0 {
            dispImageNo = 11
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 11 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //最初は0番の名前を入れた状態
        let image = UIImage(named: "eto_mark01_nezumi")
        imageView.image = image
    }
    
    //画像をタップすると画面が遷移
    @IBAction func onTapimage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let ResultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているviewerImgに値を代入して渡す
        ResultViewController.viewerImg = name.text
    }

    
    
    //「戻る」の動き
    @IBAction func onPrev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 画像を表示するメソッドを呼ぶ
        displayImage()
        
        //再生ボタンがタップされたときは動かない
        
    }
    
    //「進む」の動き
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 画像を表示するメソッドを呼ぶ
        displayImage()
        //再生ボタンがタップされたときは動かない
        
    }
    
    
    //「再生/停止」の動き
    
    // タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    //1秒ずつカウントするタイマー
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
    }

    
    @IBAction func slideShow(_ sender: Any) {
        
        if self.timer != nil {
            timer?.invalidate()
            timer = nil
        } else {
            
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        
    }
    
    //2秒ごとに呼ばれるメソッド
    @objc func updateTimer(){
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 画像を表示するメソッドを呼ぶ
        displayImage()
    }
    

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

