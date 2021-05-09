//
//  CodingProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 09/05/21.
//

#import "CodingProblems.h"
#import "LongestPalindromeSS.h"
#import "ExpressionEvaluation.h"
#import "AllSubSequences.h"
#import "BoxMaxStack.h"

@implementation CodingProblems

+ (void)codingProblemsMenu
{
    NSInteger choice = 1;
    switch (choice) {
        case 1:
        {
            NSString *testSeq = @"a101a";
            NSString *longestSeq = [[[LongestPalindromeSS alloc] init] findLongestPalindromicSubSequence:testSeq];
            NSLog(@"Longest subsequence - %@", longestSeq);
        }
            break;
        case 2:
        {
            NSString *expres1 = @"(1+((2+3)*(4*5)))";
            //NSString *expres2 = @"(1((23+)(45*)*)+)";
            ExpressionEvaluation *eval = [[ExpressionEvaluation alloc] init];
            BOOL isValid = [eval evaluateExpression:expres1];
            NSLog(@"Is valid - %d", isValid);
        }
            break;
        case 3:
        {
            NSString *testSeq = @"a101a";
            NSString *longestSeq = [[[LongestPalindromeSS alloc] init] findLongestPalindromicSubSequenceDP:testSeq];
            NSLog(@"Longest subsequence - %@", longestSeq);
        }
            break;
        case 4:
        {
            [AllSubSequences printAllSubsequencesOf:@"abc"];
        }
            break;
        case 5:
        {
            NSMutableArray *boxes = NSMutableArray.new;
            [boxes addObject: @{@"W": @(10), @"H": @(10)}];
            [boxes addObject: @{@"W": @(10), @"H": @(3)}];
            [boxes addObject: @{@"W": @(10), @"H": @(2)}];
            [boxes addObject: @{@"W": @(2), @"H": @(4)}];
            [boxes addObject: @{@"W": @(1), @"H": @(1)}];
            
            int maxCount = [[BoxMaxStack alloc] generateMaxStack:boxes];
            NSLog(@"Max stack is %d", maxCount);
        }
            break;
        default:
            break;
    }
}

@end
