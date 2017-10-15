//
//  ExerciseViewController.swift
//  JeonMiSeon2
//
//  Created by SWUCOMPUTER on 2017. 10. 15..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    @IBOutlet var exerciseTIme: UILabel!
    @IBOutlet var hiddenVIew: UIView!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    
    var result:Int = 0
    var seconds:Int = 0
    var timer = Timer()
    var fixTime:Int = 0
    
    var timerStarting : Bool! = false
    var restart : Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenVIew.isHidden = true
        
        super.viewDidLoad()
        pauseButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func walkButton(_ sender: UIButton) {
        //walk kcal = 2kcal
        exerciseTIme.text = "걷기     \(result / 2)분  입니다."
        seconds = (result/2)*60
        fixTime = seconds
        hiddenVIew.isHidden = false
    }
    
    @IBAction func runningTime(_ sender: UIButton) {
        //running kcal = 8kcal
        exerciseTIme.text = "달리기    \(result / 8)분  입니다."
        seconds = (result/8) * 60
        hiddenVIew.isHidden = false
    }
    
    @IBAction func cycleTime(_ sender: UIButton) {
        //cycleTime kcal = 7kcal
        exerciseTIme.text = "자전거    \(result / 7)분  입니다."
        seconds = (result/7) * 60
        fixTime = seconds
        hiddenVIew.isHidden = false
    }
    
    @IBAction func jumppingTime(_ sender: UIButton) {
        //rope jumpping kcal = 6kcal
        exerciseTIme.text = "줄넘기    \(result / 6)분  입니다."
        seconds = (result/6) * 60
        fixTime = seconds
        hiddenVIew.isHidden = false
    }
    
    //timer 에 관한 액션 
    @IBAction func pressStart(_ sender: UIButton) {
        if timerStarting == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        timerStarting = true
        pauseButton.isEnabled = true
    }
    
    @IBAction func pressPause(_ sender: UIButton) {
        
        if self.restart == false {
            timer.invalidate()
            timerStarting = false
            self.restart = true
            self.pauseButton.setTitle("restart",for: .normal)
            }
        else{
            runTimer()
            self.restart = false
            timerStarting = true
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }

    @IBAction func pressStop(_ sender: UIButton) {
        //1
        timer.invalidate()
        //2
        seconds = fixTime
        
        let hoursLeft = Int(seconds) / 3600
        let minutesLeft = Int(seconds) / 60 % 60
        let secondsLeft = Int(seconds) % 60
        
        timeLabel.text = "\(hoursLeft) : \(minutesLeft) : \(secondsLeft)"
        //3
        timerStarting = false
        
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    func updateTimer() {
        seconds -= 1
        let completionPercentage = Int(((Float(fixTime) - Float(seconds))/Float(fixTime)) * 100)
        
        let hoursLeft = Int(seconds) / 3600
        let minutesLeft = Int(seconds) / 60 % 60
        let secondsLeft = Int(seconds) % 60
        
        timeLabel.text = "\(hoursLeft) : \(minutesLeft) : \(secondsLeft)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
