//
//  WildcardPatternMatch.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 10/05/21.
//

#import "WildcardPatternMatch.h"

@implementation WildcardPatternMatch

+ (BOOL)isPattern:(NSString *)pattern match:(NSString *)string
{
    BOOL isMatch = [WildcardPatternMatch isPattern:pattern BruteForceMatch:string];
    return isMatch;
}

+ (BOOL)isPattern:(NSString *)pattern BruteForceMatch:(NSString *)string
{
    
    int i=0; // string iterator
    int j=0; // pattern iterator
    
    BOOL prevLookUp = NO;
    
    while (i < string.length) {
        
        if (j >= pattern.length) {
            return NO;
        }
        
        unichar strAtI = [string characterAtIndex:i];
        unichar pAtJ = [pattern characterAtIndex:j];
        
        if (strAtI == pAtJ) {
            i++;
            j++;
            prevLookUp = NO;
        } else {
            if (pAtJ == '?' && (pattern.length > string.length)) {
                j++;
                prevLookUp = YES;
            } else {
                if (prevLookUp) {
                    i++;
                    prevLookUp = NO;
                } else if (pattern.length == string.length) {
                    i++;
                    j++;
                } else {
                    return NO;
                }
            }
        }
        
    }
    
    return YES;
}

@end
