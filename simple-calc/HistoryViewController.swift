//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Joe Motto on 1/31/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var history: [String] = []
    @IBOutlet weak var scrollHist: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayHistory()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearHist(_ sender: Any) {
        history = []
        displayHistory()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.history = history
    }

    func displayHistory(){
        if history.count != 0 {
            for index in 0...history.count-1{
                let label = UILabel(frame:CGRect(x: 50, y: index*25+50, width: 300, height: 40))
                label.text = history[index]
                scrollHist.contentSize = CGSize(width: 300, height: index*26 + 70)
                scrollHist.addSubview(label)
            }
        }else{
            scrollHist.subviews.forEach({$0.removeFromSuperview()})
        }
    }

}
