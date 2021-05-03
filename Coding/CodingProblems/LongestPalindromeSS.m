//
//  LongestPalindromeSS.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 26/04/21.
//

#import "LongestPalindromeSS.h"
#import "Utils.h"

@implementation LongestPalindromeSS

-(NSString *)findLongestPalindromicSubSequence:(NSString *)string
{
    if (string.length == 1) {
        return string;
    }
    
    NSString *maxPal = @"";
    for (int i=0; i<string.length-1; i++) {
        NSString *nextPal = @"";
        for (int j=i; j<string.length; j++) {
            nextPal = [nextPal stringByAppendingString:[NSString stringWithFormat:@"%c", [string characterAtIndex:j]]];
            if ( (nextPal.length > maxPal.length) && [Utils isPalindrome:nextPal]) {
                maxPal = nextPal;
            }
        }
    }
    return maxPal;
}

-(NSString *)findLongestPalindromicSubSequenceDP:(NSString *)string
{
    if (string.length == 1) {
        return string;
    }
    
    return @"";
}


@end
