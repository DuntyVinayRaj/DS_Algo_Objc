//
//  DPProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "DPProblems.h"
#import "DPFibonacci.h"

@implementation DPProblems

+ (void)DPProblemsMenu:(int)choice
{
    switch (choice) {
        case 1:
        {
            int fib = [DPFibonacci getFibonacci:9];
            NSLog(@"Fibonacci is - %d", fib);
        }
            break;
        default:
            break;
    }
}

@end
