//
//  UserInput.m
//  Guessing Game ObjC
//
//  Created by Rodney Sampson on 8/16/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>

NSNumber * getNumberFromUser(int maxValidChoice, const char *prompt) {
    int choice = -1;
    int numberOfItemsScanned = 0;
    int firstValidChoice = 0;
    
    fpurge(stdin);
    NSLog(@"%s", prompt);
    numberOfItemsScanned = scanf("%d", &choice);
    if ((numberOfItemsScanned == 1) && (choice >= firstValidChoice) && (choice <= maxValidChoice)) {
        return @(choice);
    }
    
    return @(-1);
}

BOOL getStringFromUser(char tempNameArray[], int nameLength, const char *prompt) {
    char * result = NULL;
    while (result != tempNameArray) {
        fpurge(stdin);
        NSLog(@"%s", prompt);
        result = fgets(tempNameArray, nameLength, stdin);
        NSLog(@"\n");
    }
    
    return YES;
}
