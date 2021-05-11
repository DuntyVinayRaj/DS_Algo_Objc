//
//  StringRepeat.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 10/05/21.
//

#import "StringRepeat.h"

@implementation StringRepeat

+ (BOOL)isStringRepeatitionOfKChars:(NSString *)str charCount:(int)k
{
    if (str.length % k > 0) {
        return NO;
    }
    
    for (int i=0, j=k; j<str.length; j++, i++) {
        unichar atI = [str characterAtIndex:i];
        unichar atJ = [str characterAtIndex:j];
        if (atI != atJ) {
            return NO;
        }
    }
    return YES;
}

@end
