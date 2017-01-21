//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 梶文乃 on 2017/01/21.
//  Copyright © 2017年 ayano.kaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
 
    let imageNameArray = ["01.jpeg","02.jpeg","03.jpeg",]
    var dispImageNo = 0
    var timer: Timer!
    var changecStartStopBtn = true
    
    @IBAction func onTapImage(_ sender: Any) {

    // セグエを使用して画面を遷移
    performSegue(withIdentifier: "toExpandedView", sender: nil)

        startStopbtn()
            
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let expandedViewController: ExpandedViewController = segue.destination as! ExpandedViewController
        
        let name = imageNameArray[dispImageNo]
        expandedViewController.name = name
        
    }
    
    //進むのアクション
    func displayImage() {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        if dispImageNo > 2 {
            dispImageNo = 0
            // 範囲より上を指している場合、最初の画像を表示
            let name = imageNameArray[dispImageNo]
            // 画像を読み込み
            imageView.image = UIImage(named: name)
        }else{
            // 範囲より上を指している場合、最初の画像を表示
            let name = imageNameArray[dispImageNo]
            // 画像を読み込み
            imageView.image = UIImage(named: name)
        }
        
    }

    //戻るのアクション
    func displayImageBack() {
        dispImageNo -= 1
        
        if dispImageNo < 0 {
            dispImageNo = 2
            let name = imageNameArray[dispImageNo]
            imageView.image = UIImage(named: name)
        }else{
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]
            // 画像を読み込
            imageView.image = UIImage(named: name)
        }
    }
    
    //再生停止のアクション
    func startStopbtn(){
        //再生ボタンを押す時
        if changecStartStopBtn {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.displayImage), userInfo: nil, repeats: true)
 
            changecStartStopBtn = false
            nextButton.isEnabled = false
            backButton.isEnabled = false
            startButton.setTitle("停止", for: .normal)
 
        }else{
            // 停止ボタンを押す時
            timer.invalidate()
            timer = nil
            changecStartStopBtn = true
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }
    }
    

    @IBAction func nextButtonTapped(_ sender: Any) {
        displayImage()
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        startStopbtn()
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        displayImageBack()
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        startStopbtn()
    }

}


