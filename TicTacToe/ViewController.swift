//
//  ViewController.swift
//  TicTacToe
//
//  Created by Marino Schmid on 21.08.18.
//  Copyright © 2018 Marino Schmid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var player = 1;
    var game = [0,0,0,0,0,0,0,0,0]
    var winner = 0;
    var gameend = false;
    
    @IBOutlet weak var restart: UIButton!
    @IBAction func restart(_ sender: Any) {
        reload();
    }
    func reload() {
         player = 1;
         game = [0,0,0,0,0,0,0,0,0]
         winner = 0;
         gameend = false;
        collectionView.reloadData();
        text.text = "Tic-Tac-Toe"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "field", for: indexPath)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        if(game[indexPath.row] == 1) {
            view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
        if(game[indexPath.row] == 2) {
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        }
        return view;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(!gameend && game[indexPath.row] == 0) {
            player = player == 1 ? 2 : 1;
            game[indexPath.row] = player;
            print("x");
            collectionView.reloadData();
            testWinner();
        }
    }
    
    
    func testRow(_ numbers: [Int]) -> Bool {
        if(game[numbers[0]] == game[numbers[1]] && game[numbers[0]] == game[numbers[2]] && game[numbers[0]] != 0) {
            winner = game[numbers[0]];
            return true;
        }
        return false;
    }
    
    func testWinner() {
        if(testRow([0,1,2]) || testRow([3,4,5]) || testRow([6,7,8])
             || testRow([0,3,6])  || testRow([1,4,7])  || testRow([2,5,8])
            || testRow([0,4,8])  || testRow([2,4,6])) {
            text.text = "player \(winner == 1 ? "red" : "blue") Wins";
            gameend = true;
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

