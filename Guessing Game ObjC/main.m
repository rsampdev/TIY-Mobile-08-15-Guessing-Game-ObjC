//
//  main.m
//  Guessing Game ObjC
//
//  Created by Rodney Sampson on 8/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>

void start(void);
int getNumberFromUser(int maxValidChoice, const char *prompt);
bool getStringFromUser(char tempNameArray[], NSString * destination, int nameLength, const char *prompt);

int main(int argc, const char * argv[]) {
    
    start();
    
    return 0;
}

void start() {
    NSString *name = NULL;
    NSNumber *correctNumber = @(arc4random_uniform(10));
    NSNumber *userGuess = @(-1);
    NSMutableArray *userGuesses = [[NSMutableArray alloc] init];
    
    int counter = 3;
    
    char tempNameArray[100];
    getStringFromUser(tempNameArray, name, 100, "What is your name?\n\n");
    
    while (counter != 0) {
        userGuess = @(getNumberFromUser(9, "Enter a number 0 - 9.\n\n"));
        
        if ([userGuess isEqual: correctNumber]) {
            NSLog(@"%@ ,you guessed the right number. It was %@\n\n", name, userGuess);
            break;
        } else {
            counter--;
            NSLog(@"%@, you have %d trys left.\n\n", name, counter);
            [userGuesses addObject: userGuess];
            NSLog(@"%@ your previous guesses are %@\n\n", name, userGuesses);
        }
    }
}

int getNumberFromUser(int maxValidChoice, const char *prompt) {
    int choice = -1;
    int numberOfItemsScanned = 0;
    int firstValidChoice = 0;
    
    fpurge(stdin);
    printf("%s", prompt);
    numberOfItemsScanned = scanf("%d", &choice);
    if ((numberOfItemsScanned == 1) && (choice >= firstValidChoice) && (choice <= maxValidChoice)) {
        return choice;
    }
    
    return -1;
}

bool getStringFromUser(char tempNameArray[], NSString * destination, int nameLength, const char *prompt) {
    char * result = NULL;
    while (result != tempNameArray) {
        fpurge(stdin);
        printf("%s", prompt);
        result = fgets(tempNameArray, nameLength, stdin);
        destination = @(result);
        printf("\n");
    }
    
    return true;
}
