//
//  DPProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "DPProblems.h"
#import "DPFibonacci.h"
#import "StringInterleavingDP.h"

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
        case 2:
        {
            NSArray *testValues = @[@[@"acdb", @"ab", @"cd"],
            @[@"ADEBCF", @"ABC", @"DEF"],
            @[@"ACBCD", @"ABC", @"CD"],
            @[@"ACDABC", @"ABC", @"ACC"]];
            
            for (NSArray *test in testValues) {
                NSString *string = test.firstObject;
                NSString *firstStr = test[1];
                NSString *secondStr = test.lastObject;
                BOOL isRecInterleaving = [StringInterleavingDP interleavingRec:string firstStr:firstStr secondStr:secondStr];
                BOOL isBUInterleaving = [StringInterleavingDP interleavingBU:string firstStr:firstStr secondStr:secondStr];
                NSLog(@"Is interleaving %d vs BU interleaving %d", isRecInterleaving, isBUInterleaving);
            }
        }
            break;
        default:
            break;
    }
}

@end
