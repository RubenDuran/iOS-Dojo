//: [Previous](@previous)

import Foundation

import UIKit


class Animal {
    var name: String!
    var health = 100
    
    init(name: String){
        self.name = name
    }
    
    func displayHealth(){
        print(self.health)
    }
}

class Cat: Animal {
    
    init(catName: String){
        super.init(name: catName)
        self.health = 150
    }
    
    
    func growl(){
        print("Rawr")
    }
    
    func run(){
        print("Running")
        self.health -= 10
    }
}

class Lion: Cat {
    
    init(lionName: String){
        super.init(catName: lionName)
        self.health = 200
    }
    
    
    override func growl() {
        print("ROAR!!! I am the king of the Jungle")
    }
}

class Cheetah: Cat{
    
    init(cheetahName: String){
        super.init(catName: cheetahName)
    }
    
    override func run(){
        if self.health >= 50 {
            print("Running Fast")
            self.health -= 50
        }
        
    }
    
    func sleep(){
        if self.health + 50 <= 200 {
            self.health += 50
        }
    }
}