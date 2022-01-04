//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    override func viewDidLoad() { // Mikor betölt az app, 0-ra állítja a progress bar-t
        super.viewDidLoad()
        // Do any additional setup after load ing the view.
        progressBar.progress = 0.0
        
    }
    
    @IBOutlet weak var progressBar: UIProgressView! //progress bar
    @IBOutlet weak var titleLabel: UILabel! //fenti szövegmező
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720] //Dict-ekbe rakjuk a keménységhez tartozó időket (mp-ben)
    var timer = Timer()
    var totalTime = 0 //kezdőértékeknek 0-t veszünk
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) { //gomb
        
        timer.invalidate() //ha megnyomjuk a keménységet, az előző timer-t lenullázza
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        //Ez maga az időzítő, ami másodpercenként triggereli az alább lévő updateTimer függvényt
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime) //kiszámoljuk hogy a progress bar az idő alapján hol tart
            
        } else {
            timer.invalidate() // ha kész, lenullázzuk, és kiíratjuk felülre hogy kész
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") //és lejátszuk a hangot
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
}
