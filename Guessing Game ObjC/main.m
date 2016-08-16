//
//  main.m
//  Guessing Game ObjC
//
//  Created by Rodney Sampson on 8/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInput.h"

void start(void);

int main(int argc, const char * argv[]) {
    
    start();
    
    return 0;
}

void start() {
    NSString *name = NULL;
    NSNumber *randomNumber = @(arc4random_uniform(10));
    NSNumber *userGuess = @(-1);
    NSMutableArray *userGuesses = [[NSMutableArray alloc] init];
    
    char tempNameArray[100] = {'\0'};
    if (getStringFromUser(tempNameArray, 100, "What is your name?\n\n")) {
        name = @(tempNameArray);
        if ([name containsString:@"\n"]) {
            name = [name substringToIndex:[name length]-1];
        }
    }
    
    int counter = 3;
    
    while (counter != 0) {
        userGuess = getNumberFromUser(9, "Enter a number 0 - 9.\n\n");
        
        if ([userGuess isEqual: randomNumber]) {
            NSLog(@"%@ ,you guessed the right number. It was %@\n\n", name, userGuess);
            break;
        } else {
            counter--;
            NSLog(@"%@, you did not guess the correct number", name);
            NSLog(@"%@, you have %d trys left.\n\n", name, counter);
            [userGuesses addObject: userGuess];
            NSLog(@"%@ your previous guesses are %@\n\n", name, userGuesses);
        }
        
        if (counter == 0) {
            NSLog(@"%@, you did not guess the right number. The answer was %@\n", name, randomNumber);
        }
    }
}
