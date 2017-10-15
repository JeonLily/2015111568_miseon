//
//  ViewController.swift
//  JeonMiSeon2
//
//  Created by SWUCOMPUTER on 2017. 10. 15..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var resultView: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var exerciseButton: UIButton!
    @IBOutlet var checkButton: UIButton!
    
    
    var foodArray: Array<String> = [] // 음식 배열 초기화
    var foodKcal:Int = 0
    var plus:Int = 0
    var result:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        foodArray = ["햄버거", "떡볶이", "피자", "김치찌개", "짜장면"] // 피커 항목 설정
        
    }
    
    //UIPickerViewDataSource how many component you have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foodArray.count
    }
    
    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foodArray[row]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resultView.text = "총 열량 :        "+textField.text!+"    Kcal 입니다."
        plus = Int(textField.text!)!
        return true
    }

    @IBAction func checkResult(_ sender: UIButton) {
        let index = pickerView.selectedRow(inComponent: 0)
        
        if index == 0{
            foodKcal = 253
        }else if index == 1{
            foodKcal = 404
        }else if index == 2{
            foodKcal = 121
        }else if index == 3{
            foodKcal = 785
        }
        
        resultView.text = "총 열량 :         \(foodKcal+plus)    Kcal 입니다."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExercise"{
            
            let destVC = segue.destination as! ExerciseViewController
            
            destVC.title = exerciseButton.titleLabel?.text
            
            destVC.result = foodKcal + plus
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

