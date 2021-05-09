//
//  main.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 21/04/21.
//

#import <Foundation/Foundation.h>
#import "TreeProblems.h"
#import "GraphProblems.h"
#import "ArrayProblems.h"
#import "CodingProblems.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int choice = 3;
        switch (choice) {
            case 1:
                [CodingProblems codingProblemsMenu:1];
                break;
            case 2:
                [ArrayProblems arrayProblemsMenu];
                break;
            case 3:
                [TreeProblems treeProblemsMenu:6];
                break;
            case 4:
                [GraphProblems graphProblemsMenu];
                break;
            default:
                break;
        }
    }
    return 0;
}
