//
//  Utils.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 26/04/21.
//

#import "Utils.h"

@implementation Utils

+ (BOOL) isPalindrome:(NSString *)string
{
    for (int i=0; i<string.length; i++) {
        unichar charAtI = [string characterAtIndex:i];
        unichar chartAtIE = [string characterAtIndex:string.length-i-1];
        
        if (chartAtIE != charAtI) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isNumber:(NSNumber *)n1 lessThan:(NSNumber *)n2
{
    return n1.intValue < n2.intValue;
}

@end
