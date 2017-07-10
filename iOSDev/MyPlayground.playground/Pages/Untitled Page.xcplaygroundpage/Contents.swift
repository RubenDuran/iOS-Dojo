//: Playground - noun: a place where people can play

import UIKit

func tossCoin() -> String {
    let coinFlip = Int(arc4random_uniform(3))
    var flipResult = "";
    if coinFlip < 1 {
        print("coin flip landed on heads");
        flipResult = "heads";
    }
    else{
        print("coin flip landed on tails");
        flipResult = "tails";
    }
    return flipResult;
}



func tossMultipleCoins(n: Int) -> Double {
    var headCounter = 0;
    
    for _ in 0...n{
        let result = tossCoin()
        print(result);
        if result == "heads"{
            headCounter += 1;
    }
    }
    return (Double(headCounter)/Double(n));
    
}

var test = tossMultipleCoins(n: 5);
print("printing test");
print(test);

