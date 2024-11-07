//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Batch-2 on 04/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var btn00: UIButton!
    @IBOutlet var btn01: UIButton!
    @IBOutlet var btn02: UIButton!
    @IBOutlet var btn10: UIButton!
    @IBOutlet var btn11: UIButton!
    @IBOutlet var btn12: UIButton!
    @IBOutlet var btn20: UIButton!
    @IBOutlet var btn21: UIButton!
    @IBOutlet var btn22: UIButton!
    
    
    @IBOutlet var playerTurnLabel: UILabel!
    
    
    enum Player
    {
        case X
        case o
    }
    
    
    var firstTurn = Player.X
    var currentTurn = Player.o
    
    var board = [UIButton]()
    var cross = "X"
    var naught = "O"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetBoard()
        board.append(btn00)
        board.append(btn01)
        board.append(btn02)
        board.append(btn10)
        board.append(btn11)
        board.append(btn12)
        board.append(btn20)
        board.append(btn21)
        board.append(btn22)
        
    }

    
    @IBAction func makeMove(_ sender: UIButton) {
        
        addToBoard(sender)
        if victory(cross)
        {
            resultAlert(title: "Cross Wins!")
            
        }
        if victory(naught)
        {
            resultAlert(title: "Naught Wins!")
            
        }
        if (boardFull())
        {
            resultAlert(title: "Draw")
            
        }
    }
    
    func boardFull() -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(currentTurn == Player.o)
            {
                sender.setTitle(naught, for: .normal)
                currentTurn = Player.X
                playerTurnLabel.text = cross
                
            }
            else if(currentTurn == Player.X)
            {
                sender.setTitle(cross, for: .normal)
                currentTurn = Player.o
                playerTurnLabel.text = naught
                
            }
            sender.isEnabled = false
        }
    }
    
    func victory(_ s: String) -> Bool
    {
        if matchSymbol(btn00, s) && matchSymbol(btn01, s) && matchSymbol(btn02, s)
        {
            return true
        }
        if matchSymbol(btn10, s) && matchSymbol(btn11, s) && matchSymbol(btn12, s)
        {
            return true
        }
        if matchSymbol(btn20, s) && matchSymbol(btn21, s) && matchSymbol(btn22, s)
        {
            return true
        }
        
        if matchSymbol(btn00, s) && matchSymbol(btn10, s) && matchSymbol(btn20, s)
        {
            return true
        }
        if matchSymbol(btn01, s) && matchSymbol(btn11, s) && matchSymbol(btn21, s)
        {
            return true
        }
        if matchSymbol(btn02, s) && matchSymbol(btn12, s) && matchSymbol(btn22, s)
        {
            return true
        }
        
        if matchSymbol(btn00, s) && matchSymbol(btn11, s) && matchSymbol(btn22, s)
        {
            return true
        }
        if matchSymbol(btn02, s) && matchSymbol(btn11, s) && matchSymbol(btn20, s)
        {
            return true
        }
        
        return false
    }
    func matchSymbol(_ button : UIButton, _ symbol: String) -> Bool{
        return button.title(for: .normal) == symbol
        
    }
    
    func resultAlert(title: String)
    {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default,handler: { (_) in self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard()
    {
        for button in board
        {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Player.o
        {
            firstTurn = Player.X
            playerTurnLabel.text = cross
        }
        else if firstTurn == Player.X
        {
            firstTurn = Player.o
            playerTurnLabel.text = naught
        }
        currentTurn = firstTurn
    }

}

