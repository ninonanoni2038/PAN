//
//  ViewController.swift
//  PAN
//
//  Created by 二宮啓 on 2020/02/06.
//  Copyright © 2020 二宮啓. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox


class ViewController: UIViewController {
 
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    @IBOutlet var button4:UIButton!
    @IBOutlet var button5:UIButton!
    @IBOutlet var button6:UIButton!
    @IBOutlet var button7:UIButton!
    @IBOutlet var button8:UIButton!
    @IBOutlet var button9:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pan(sender:UIButton){
        playSound(name: "PAN")
        shortVibrate()
        button1.setBackgroundImage(UIImage(named:"Inactive.png"), for: .normal)
        sender.setBackgroundImage(UIImage(named:"active.png"), for: .normal)
    }
    
    func shortVibrate() {
        AudioServicesPlaySystemSound(1519);
        AudioServicesDisposeSystemSoundID(1519);
    }

    

}

extension ViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
}

