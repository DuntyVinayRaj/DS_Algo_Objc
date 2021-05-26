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
#import "DPProblems.h"

/**
 Problems to solve :
 Peak element in array
 
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *tenantSettings = nil;
        NSDictionary *filesPolicy = [tenantSettings objectForKey:@"filesPolicy"];
        NSLog(@"filesPolicy is %@", filesPolicy);
        
        int choice = 2;
        switch (choice) {
            case 1:
                [CodingProblems codingProblemsMenu:8];
                break;
            case 2:
                [ArrayProblems arrayProblemsMenuWithChoice:8];
                break;
            case 3:
                [TreeProblems treeProblemsMenu:6];
                break;
            case 4:
                [GraphProblems graphProblemsMenu];
                break;
            case 5:
                [DPProblems DPProblemsMenu:2];
                break;
            default:
                break;
        }
    }
    return 0;
}
