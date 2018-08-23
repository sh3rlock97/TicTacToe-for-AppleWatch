//
//  InterfaceController.swift
//  TicTacToe WatchKit Extension
//
//  Created by Marino Schmid on 21.08.18.
//  Copyright © 2018 Marino Schmid. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var ttt0: WKInterfaceButton!
    @IBOutlet var ttt1: WKInterfaceButton!
    @IBOutlet var ttt2: WKInterfaceButton!
    @IBOutlet var ttt3: WKInterfaceButton!
    @IBOutlet var ttt4: WKInterfaceButton!
    @IBOutlet var tt5: WKInterfaceButton!
    @IBOutlet var ttt6: WKInterfaceButton!
    @IBOutlet var ttt7: WKInterfaceButton!
    @IBOutlet var ttt8: WKInterfaceButton!
    
    @IBOutlet var textlabel: WKInterfaceLabel!
    
    @IBAction func restart() {
         player = 1;
         game = [0,0,0,0,0,0,0,0,0]
         winner = 0;
         gameend = false;
        for button in buttons {
            button.setBackgroundColor(UIColor(white: 0.2, alpha: 1));
        }
        textlabel.setText("Tic-Tac-Toe")
    }
    
    @IBAction func click0() {
        didclick(0);
    }
    @IBAction func click1() {
        didclick(1);
    }
    @IBAction func click2() {
        didclick(2);

    }
    @IBAction func click3() {
        didclick(3);

    }
    @IBAction func click4() {
        didclick(4);

    }
    @IBAction func click5() {
        didclick(5);

    }
    @IBAction func click6() {
        didclick(6);

    }
    @IBAction func click7() {
        didclick(7);

    }
    @IBAction func click8() {
        didclick(8);

    }
    
    var player = 1;
    var game = [0,0,0,0,0,0,0,0,0]
    var winner = 0;
    var gameend = false;
    
    var buttons : [WKInterfaceButton] = [];
    
    func testRow(_ numbers: [Int]) -> Bool {
        print("4");
        if(game[numbers[0]] == game[numbers[1]] && game[numbers[0]] == game[numbers[2]] && game[numbers[0]] != 0) {
            winner = game[numbers[0]];
            print("5");
            return true;
        }
        return false;
    }
    
    func testWinner() {
        if(testRow([0,1,2]) || testRow([3,4,5]) || testRow([6,7,8])
            || testRow([0,3,6])  || testRow([1,4,7])  || testRow([2,5,8])
            || testRow([0,4,8])  || testRow([2,4,6])) {
            
            self.textlabel.setText("player \(winner == 1 ? "red" : "blue") Wins");
            self.textlabel.setTextColor(UIColor(red: (winner == 1 ? 1 : 0), green: 0, blue: (winner == 2 ? 1 : 0), alpha: 1))
            
            
            print("player \(winner == 1 ? "red" : "blue") Wins")
            gameend = true;
            print("2");
        }
        print("3");
    }
    
    func didclick(_ i : Int) {
        if(!gameend && game[i] == 0) {
            player = player == 1 ? 2 : 1;
            game[i] = player;
            print("x");
            if(game[i] == 1) {
                buttons[i].setBackgroundColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1))
            }
            if(game[i] == 2) {
                buttons[i].setBackgroundColor(UIColor(red: 0, green: 0, blue: 1, alpha: 1))
            }
            testWinner();
            print("1");
        }
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        buttons = [ttt0, ttt1, ttt2, ttt3, ttt4, tt5, ttt6, ttt7, ttt8];
        // Configure interface objects here.
        restart();
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
