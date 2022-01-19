//
//  ViewController.swift
//  Lab1_febinRukfanSajidShakkeela_c0826772_iOS
//
//  Created by user209120 on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oScoreLbl: UILabel!
    @IBOutlet weak var xScoreLbl: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!

    @IBOutlet weak var msgLbl: UILabel!
    var buttons = [UIButton]()
    
    var curPlayer = 1
    
    var count1 = 0

    var count2 = 0
    
    var value = ""

    var msg: String = ""

    
    let comb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4 ,6]]
    
    var gameisActive = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
                swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
                view.addGestureRecognizer(swipeLeft)
                
                let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
                swipeRight.direction = UISwipeGestureRecognizer.Direction.right
                view.addGestureRecognizer(swipeRight)
        
        // Do any additional setup after loading the view.
    }

    @objc func swiped(gesture: UISwipeGestureRecognizer) {
           let swipeGesture = gesture as UISwipeGestureRecognizer
           switch swipeGesture.direction {
           case UISwipeGestureRecognizer.Direction.left:
                reset_game()
               var xCore = 0
               var oCore = 0
               xScoreLbl.text = "'X = '" + String(0)
               oScoreLbl.text = "'O = '" + String(0)

           case UISwipeGestureRecognizer.Direction.right:
                reset_game()
               var xCore = 0
               var oCore = 0
               xScoreLbl.text = "'X = '" + String(0)
               oScoreLbl.text = "'O = '" + String(0)


           default:
               break
           }
       }
    
    func addButtons()->Void{
        buttons.append(a1)
        buttons.append(a2)
        buttons.append(a3)

        buttons.append(b1)
        buttons.append(b2)
        buttons.append(b3)

        buttons.append(c1)
        buttons.append(c2)
        buttons.append(c3)

        
    }
    

    @IBAction func makeMove(_ sender: AnyObject) {
        var completed = 0;
        if(sender.currentBackgroundImage == UIImage(named: "")){
            sender.setBackgroundImage(UIImage(named: value), for: .normal)
            if(curPlayer == 1){
                curPlayer = 2
                value = "Nought"
            }
            else{
                curPlayer = 1
                value = "Cross"
            }
        }
        for btn in buttons {
                    if(btn.currentBackgroundImage == UIImage(named: "")){
                        completed += 1
                    }
                }
                if(completed <= 0){
                    reset_game()
                    msg = "Game is even!"
                }
                else{
                    checker()
                }
        
        
//        if(sender.currentBackgroundImage == UIImage(named: "")){
//            if(curPlayer == 1){
//                sender.setBackgroundImage(UIImage.init(named: "Cross"), for: .normal);
//                curPlayer = 2
//                value = "Cross"
//            }
//            else{
//                sender.setBackgroundImage(UIImage.init(named: "Nought"), for: .normal);
//                curPlayer = 1
//                value = "Nought"
//
//
//            }
//
//        }
        
        
    }

func checker(){
    let if_x_win = check_winner(value: "x");
        let if_o_win = check_winner(value: "o");
        if(if_x_win) {
            xScore()
            reset_game()
             msg = "Player X Won!"
            msgLbl.text = "Player X Won"
        }
        if(if_o_win) {
            oScore()
            reset_game()
             msg = "Player O Won!"
            msgLbl.text = "Player O Won"
        }
}

func check_winner(value: String) -> Bool{
    
    // horizontal tiles check
           if buttonIsEmpty(button: buttons[0], value: value) && buttonIsEmpty(button: buttons[1], value: value) && buttonIsEmpty(button: buttons[2], value: value){
               return true
           }
           if buttonIsEmpty(button: buttons[3], value: value) && buttonIsEmpty(button: buttons[4], value: value) && buttonIsEmpty(button: buttons[5], value: value){
               return true
           }
           if buttonIsEmpty(button: buttons[6], value: value) && buttonIsEmpty(button: buttons[7], value: value) && buttonIsEmpty(button: buttons[8], value: value){
               return true
           }
           // vertical tiles check
           if buttonIsEmpty(button: buttons[0], value: value) && buttonIsEmpty(button: buttons[3], value: value) && buttonIsEmpty(button: buttons[6], value: value){
               return true
           }
           if buttonIsEmpty(button: buttons[1], value: value) && buttonIsEmpty(button: buttons[4], value: value) && buttonIsEmpty(button: buttons[7], value: value){
               return true
           }
           if buttonIsEmpty(button: buttons[2], value: value) && buttonIsEmpty(button: buttons[5], value: value) && buttonIsEmpty(button: buttons[8], value: value){
               return true
           }
           // diagnol tiles check
           if buttonIsEmpty(button: buttons[0], value: value) && buttonIsEmpty(button: buttons[4], value: value) && buttonIsEmpty(button: buttons[8], value: value){
               return true
           }
           if buttonIsEmpty(button: buttons[2], value: value) && buttonIsEmpty(button: buttons[4], value: value) && buttonIsEmpty(button: buttons[6], value: value){
               return true
           }
           
           return false
       }
       
       func buttonIsEmpty(button: UIButton, value: String) -> Bool{
           var response = false
           if(value == "x"){
               if(button.currentBackgroundImage == UIImage(named: "Cross")){
                   response = true;
               }
           }
           if(value == "o"){
               if(button.currentBackgroundImage == UIImage(named: "Nought")){
                   response = true;
               }
           }
           return response
    
}
func reset_game() -> Void{
    for btn in buttons {
                btn.setBackgroundImage(UIImage.init(named: ""), for: .normal); // reset all the buttons to blank
            }
}
    var xCore = 0
    var oCore = 0

func xScore() -> Void{
   xCore += 1
    xScoreLbl.text = "'X' = " + String(xCore)
}
func oScore() -> Void{
    oCore += 1
     oScoreLbl.text = "'O' = " + String(oCore)
}
    
    func counter(player: Int) -> Void{
        
        
        if(player == 1){
            count1 += 1

        }else{
            count2 += 1
        }
    }
}

