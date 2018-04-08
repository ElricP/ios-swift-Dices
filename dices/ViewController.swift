//
//  ViewController.swift
//  dices
//
//  Created by Elric Y P on 2017-10-13.
//  Copyright © 2017 Elric Y P. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var counter = 5;
    var timer = Timer();
    var audioPlayer = AVAudioPlayer();
    
    class Pair {
        var active: Bool = false
        var name: String?
        
        func react(){
            if(self.active == false){
                self.active = true
            }
            else{
                self.active = false
            }
        }
    }
    struct GlobalArray{
        static var pairs = Array(repeating:Pair(), count: 7)
    }
    
    @IBOutlet weak var roll: UILabel!
    
    @IBOutlet weak var d61: UIButton!
    @IBOutlet weak var d62: UIButton!
    
    @IBOutlet weak var d63: UIButton!
    @IBOutlet weak var d64: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
        audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sound",ofType: "mp3")!))
        audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() { //not overrided here
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func press61(_ sender: UIButton) {
        GlobalArray.pairs[0].react();
    }
    @IBAction func doit(_ sender: UIButton) {
            //let n61 = arc4random_uniform(5) + 1;
        counter = 5;
        audioPlayer.play()
         timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.rollDice), userInfo: nil, repeats: true)
        
      
    }
    
    @objc func rollDice(){
        counter -= 1;
        d61.setImage(UIImage(named: "dice\(arc4random_uniform(5) + 1)"), for: .normal);
        d62.setImage(UIImage(named: "dice\(arc4random_uniform(5) + 1)"), for: .normal);
        d63.setImage(UIImage(named: "dice\(arc4random_uniform(5) + 1)"), for: .normal);
        d64.setImage(UIImage(named: "dice\(arc4random_uniform(5) + 1)"), for: .normal);
        if (counter < 0){
            timer.invalidate();
        }
    }
    
    
    
    
    
}

