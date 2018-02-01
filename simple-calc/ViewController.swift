//
//  ViewController.swift
//  simple-calc
//
//  Created by Joe Motto on 1/29/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var resLabel: UILabel!
    var combinedDisplay : String = "" {
        didSet{
            resLabel.text = combinedDisplay
        }
    }
    
    var numberBuilder : String = ""
    var numbers: [Double] = []
    var op: String = ""
    var history: [String] = []
    
    func appender(_ s: String){
        numberBuilder.append(s)
        combinedDisplay.append(s)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //resLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clearpress(_ sender: UIButton) {
        clear()
    }
    
    func clear(){
        combinedDisplay = ""
        numberBuilder = ""
        op = ""
        numbers = []
    }
    
    @IBAction func equalpress(_ sender: UIButton) {
        if(!numberBuilder.isEmpty){
            numEnd()
        }
        switch op{
        case "+":
            let sum = numbers[0] + numbers[1]
            addToHistory(combinedDisplay + " = " + String(sum))
            combinedDisplay = String(sum)
            numberBuilder = String(sum)
            numbers = []
            op = ""
        case "-":
            let sub = numbers[0] - numbers[1]
            addToHistory(combinedDisplay + " = " + String(sub))
            combinedDisplay = String(sub)
            numberBuilder = String(sub)
            numbers = []
            op = ""
        case "*":
            let times = numbers[0] * numbers[1]
            addToHistory(combinedDisplay + " = " + String(times))
            combinedDisplay = String(times)
            numberBuilder = String(times)
            numbers = []
            op = ""
        case "/":
            if(numbers[1] == 0){
                error()
            }else{
                let divide = numbers[0] / numbers[1]
                addToHistory(combinedDisplay + " = " + String(divide))
                combinedDisplay = String(divide)
                numberBuilder = String(divide)
                numbers = []
                op = ""
            }
        case "%":
            if(numbers[1] == 0){
                error()
            }else{
                let mod = Int(numbers[0]) % Int(numbers[1])
                addToHistory(combinedDisplay + " = " + String(mod))
                combinedDisplay = String(mod)
                numberBuilder = String(mod)
                numbers = []
                op = ""
            }
        case "count":
            let count = numbers.count
            addToHistory(combinedDisplay + " = " + String(count))
            clear()
            combinedDisplay = String(count)
            numberBuilder = String(count)
        case "avg":
            let count: Double = Double(numbers.count)
            var sum: Double = 0.0
            numbers.forEach({ number in
                sum += number
            })
            let avg:Double = sum/count
            addToHistory(combinedDisplay + " = " + String(avg))
            clear()
            combinedDisplay = String(avg)
            numberBuilder = String(avg)
        case "fact":
            if(numbers[0] > 20){
                clear()
            }else{
                var fact = 1
                for i in 1...Int(numbers[0]){
                    fact *= i
                }
                addToHistory(combinedDisplay + " = " + String(fact))
                clear()
                combinedDisplay = String(fact)
                numberBuilder = String(fact)
            }
        default: clear()

        }
    }
    
    /*@IBAction func next(_ sender: Any) {
        let vc = self.storyboard?.instantiateInitialViewController(withIdentifier: "hist") as! HistoryViewController
        self.present(vc, animated: true, completion: nil)
    }*/
    func addToHistory(_ toAdd: String){
        history.append(toAdd);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! HistoryViewController
        destination.history = history
    }
    
    func numEnd (){
        numbers.append(Double(numberBuilder) ?? 0)
        numberBuilder = ""
    }
    @IBAction func onepress(_ sender: Any) {
        appender("1")
    }
    @IBAction func twopress(_ sender: Any) {
        appender("2")
    }
    @IBAction func threepress(_ sender: Any) {
        appender("3")
    }
    @IBAction func fourpress(_ sender: Any) {
        appender("4")
    }
    
    @IBAction func fivepress(_ sender: Any) {
        appender("5")
    }
    @IBAction func sixpress(_ sender: Any) {
        appender("6")
    }
    @IBAction func sevenpress(_ sender: Any) {
        appender("7")
    }
    @IBAction func eightpress(_ sender: Any) {
        appender("8")
    }
    @IBAction func ninepress(_ sender: Any) {
        appender("9")
    }
    @IBAction func zeropress(_ sender: Any) {
        appender("0")
    }
    
    @IBAction func addpress(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" + ")
            op = "+"
        }
    }
    @IBAction func subpress(_ sender: Any) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" - ")
            op = "-"
        }
    }
    @IBAction func mulpress(_ sender: Any) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" * ")
            op = "*"
        }
    }
    @IBAction func divpress(_ sender: Any) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" / ")
            op = "/"
        }
    }
    @IBAction func modpress(_ sender: Any) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" % ")
            op = "%"
        }
    }
    @IBAction func countpress(_ sender: Any) {
        if((op == "" || op == "count") && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" count ")
            op = "count"
        }
    }
    @IBAction func avgpress(_ sender: Any) {
        if((op == "" || op == "avg") && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" avg ")
            op = "avg"
        }
    }
    @IBAction func factpress(_ sender: Any) {
        if(op == "" && !numberBuilder.isEmpty){
            numEnd()
            combinedDisplay.append(" fact ")
            op = "fact"
        }
    }
    
    func error(){
        let alert = UIAlertController(title: "Error", message: "Can not divide/mod by zero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`))
        self.present(alert, animated: true, completion: nil)
        clear()
    }
    
}

