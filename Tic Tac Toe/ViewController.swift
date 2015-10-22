//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jesus Lopez de Nava on 7/15/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // activePlayer code -> 1 = circle,   2 = cross
    
//    var timesPassed = 0
    
    var winningLine = 0
    
    var numberOfPlays = 0
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var line1: UIImageView!
    @IBOutlet var line2: UIImageView!
    @IBOutlet var line3: UIImageView!
    @IBOutlet var line4: UIImageView!
    @IBOutlet var line5: UIImageView!
    @IBOutlet var line6: UIImageView!
    @IBOutlet var line7: UIImageView!
    @IBOutlet var line8: UIImageView!

    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        numberOfPlays = 0
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for tag in (0...8) {
            
            button = view.viewWithTag(tag) as! UIButton
            
            button.setImage(nil, forState: .Normal)
            
            button.enabled = true
            
        }
        
        line1.alpha = 0
        line2.alpha = 0
        line3.alpha = 0
        line4.alpha = 0
        line5.alpha = 0
        line6.alpha = 0
        line7.alpha = 0
        line8.alpha = 0
        
//        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
        
        winnerLabel.frame = CGRectMake(8, 0, 0, 0)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
//        println("Hid the labels")
        
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if gameState[sender.tag] == 0 && gameActive {
        
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                
                image = UIImage(named: "circle.png")!
                
                activePlayer = 2
                
            } else {
                
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
                
            }
        
            sender.setImage(image, forState: .Normal)
            
            sender.enabled = false
            
            numberOfPlays++
            
            winningLine = 0
            
            for index in winningCombinations {
            
                winningLine++
                
                if gameState[index[0]] != 0 && gameState[index[0]] == gameState[index[1]] && gameState[index[1]] == gameState[index[2]] {
                
                    if gameState[index[0]] == 1 {
                        
                        winnerLabel.text = "Circles have won!!!"

                    } else {
                    
                        winnerLabel.text = "Crosses have won!!!"
                    
                    }

                    switch winningLine {
                        
                    case 1:
                        line1.alpha = 1
                        
                    case 2:
                        line2.alpha = 1
                        
                    case 3:
                        line3.alpha = 1
                        
                    case 4:
                        line4.alpha = 1
                        
                    case 5:
                        line5.alpha = 1
                        
                    case 6:
                        line6.alpha = 1
                        
                    case 7:
                        line7.alpha = 1
                        
                    default:
                        line8.alpha = 1
                        
                    }
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        //self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
                        
                        self.winnerLabel.frame = CGRectMake(8, 265, 307, 65)
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                        
                    })
                    
//                    println("Showed Labels")
                
                    gameActive = false
                    
                }
                
            }
            
            if numberOfPlays == 9 && gameActive {
                
                winnerLabel.text = "Sorry, it's a TIE!!"
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    //self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
                    
                    self.winnerLabel.frame = CGRectMake(8, 265, 307, 65)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    
                })
                
//                println("Showed Labels")
                
                gameActive = false

            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidLayoutSubviews() {
        
//        timesPassed++
        
        if gameActive == true {
        
            //winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
            
            winnerLabel.frame = CGRectMake(8, 0, 0, 0)
            
            playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
            
//            println("Hid the labels in SubView")
        }
        
//        println("Passed \(timesPassed) times")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

