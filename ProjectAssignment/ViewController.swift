//
//  ViewController.swift
//  ProjectAssignment
//
//  Created by David Dang on 10/2/21.
//

import UIKit

class ViewController: UIViewController {

    var xValue : Float = 0.0
    var yValue : Float = 0.0
    var originalX : Float = 0.0
    var originalY : Float = 0.0
    var gameScore : Int = 0
    var moneyTimer : Timer?
    var r : Int = 0
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var hand: UILabel!
    
    
    @IBOutlet weak var rightMoney: UILabel!
    
    @IBOutlet weak var topMoney: UILabel!
    
    
    @IBOutlet weak var leftMoney: UILabel!
    
    
    @IBOutlet weak var bottomMoney: UILabel!
    
    
//    creates the vertical slider manually
    @IBOutlet weak var verticalSlider: UISlider!
    {
        didSet
        {
            verticalSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
    }
    
    
// loads the view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        initial game score
        score.text = "$" + String(gameScore)
        
//        print("test")
        
//        timer to control when the money bags appear
        moneyTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showMoney), userInfo: nil, repeats: true)
        
//        sets the horizontal slider value to the x position of the hand
        horizontalSlider.value = 0.0

        //        sets the vertical slider value to the y position of the hand
        verticalSlider.value = 0.0
 
//        keeps track of the origianl coordinates of the hand
        originalX = Float(hand.center.x)
        originalY = Float(hand.center.y)
        
        
    }


    @IBOutlet weak var horizontalSlider: UISlider!
    

//    moves hand when horizontal slider is moved
    @IBAction func xMovement(_ sender: Any) {
        
        xValue = horizontalSlider.value
        moveHand()
    }
    
    //    moves hand when vertical slider is moved
    @IBAction func yMovement(_ sender: Any) {
        yValue = verticalSlider.value
        moveHand()
    }
    
//    moves the hand and updates score
    func moveHand()
    {
        hand.center.x = CGFloat(originalX) + CGFloat(xValue)
        hand.center.y = CGFloat(originalY) + CGFloat(yValue)
        updateScore()
    }
    
//    checks if hand is positioned on the money and adds score if it is
    func updateScore()
    {
        if (abs(hand.center.x - rightMoney.center.x) < 5 && abs(hand.center.y - rightMoney.center.y) < 5 && r == 3)
        {
            gameScore += 100
            score.text = "$" + String(gameScore)
            print("yay3")
        }
        

        if (abs(hand.center.x - leftMoney.center.x) < 5 && abs(hand.center.y - leftMoney.center.y) < 5 && r == 2)
        {
            gameScore += 100
            score.text = "$" + String(gameScore)
            print("yay2")
        }
        

        if (abs(hand.center.x - bottomMoney.center.x) < 5 && abs(hand.center.y - bottomMoney.center.y) < 5 && r == 4)
        {
            gameScore += 100
            score.text = "$" + String(gameScore)
            print("yay4")
        }
        

        if (abs(hand.center.x - topMoney.center.x) < 5 && abs(hand.center.y - topMoney.center.y) < 5 && r == 1)
        {
            gameScore += 100
            score.text = "$" + String(gameScore)
            print("yay1")
        }
    }
    
//    changes which money bags will show
    @objc func showMoney()
    {
        r = Int.random(in: 1...4)
        
        switch r {
        case 1: showTop()
            
        case 2: showLeft()
        
        case 3: showRight()
            
        case 4: showBottom()
            
        default: r = 0
        }
        
    }
    
//    shows top money bag
    func showTop()
    {
        topMoney.text = "💰"
        rightMoney.text = "🗑"
        leftMoney.text = "🗑"
        bottomMoney.text = "🗑"
    }
    
    //    shows right money bag
    func showRight()
    {
        topMoney.text = "🗑"
        rightMoney.text = "💰"
        leftMoney.text = "🗑"
        bottomMoney.text = "🗑"
    }
    
    //    shows left money bag
    func showLeft()
    {
        topMoney.text = "🗑"
        rightMoney.text = "🗑"
        leftMoney.text = "💰"
        bottomMoney.text = "🗑"
    }
    
    //    shows bottom money bag
    func showBottom()
    {
        topMoney.text = "🗑"
        rightMoney.text = "🗑"
        leftMoney.text = "🗑"
        bottomMoney.text = "💰"
    }
    
    
}

