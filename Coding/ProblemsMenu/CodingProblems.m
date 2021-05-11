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
#import "StringRepeat.h"
#import "WildcardPatternMatch.h"
#import "StringInterleaving.h"

@implementation CodingProblems

+ (void)codingProblemsMenu:(int)choice
{
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
        case 6:
        {
            NSArray *testValues = @[@[@"abcabc", @3],
                                    @[@"abcabc", @2],
                                    @[@"abababa", @2],
                                    @[@"aaa", @1]];
            for (NSArray *test in testValues) {
                NSString *ip = test.firstObject;
                int k = ((NSNumber *)test.lastObject).intValue;
                BOOL isRepeatitive = [StringRepeat isStringRepeatitionOfKChars:ip charCount:k];
                NSLog(@"Is repeatitive string of chars %d", isRepeatitive);
            }
        }
            break;
        case 7:
        {
            NSArray *testValues = @[@[@"abc", @"?bc"],
                                    @[@"bc", @"?bc"],
                                    @[@"c", @"??c"],
                                    @[@"", @"?????"],
                                    @[@"abc", @"ac"],
                                    @[@"abc", @"a?c"],
                                    @[@"a", @"a??"],
                                    @[@"abcdef", @"a???bc???ef"],
                                    @[@"abcdef", @"a?bcef"],
                                    @[@"abcdef", @"??????"]];
        
            
            for (NSArray *test in testValues) {
                NSString *ip = test.firstObject;
                NSString *pattern = test.lastObject;
                BOOL isMatch = [WildcardPatternMatch isPattern:pattern match:ip];
                NSLog(@"Is pattern match %d", isMatch);
            }
            

        }
            break;
        case 8:
        {
            NSArray *testValues = @[@[@"acdb", @"ab", @"cd"],
            @[@"ADEBCF", @"ABC", @"DEF"],
            @[@"ACBCD", @"ABC", @"CD"],
            @[@"ACDABC", @"ABC", @"ACD"]];
            
            testValues = @[@[@"ACDABC", @"ABC", @"ACD"]];
            
            for (NSArray *test in testValues) {
                NSString *string = test.firstObject;
                NSString *firstStr = test[1];
                NSString *secondStr = test.lastObject;
                BOOL isInterleaving = [StringInterleaving isString:string interleavingOf:firstStr andString:secondStr];
                NSLog(@"Is pattern match %d", isInterleaving);
            }
        }
            break;
        default:
            break;
    }
}

@end
