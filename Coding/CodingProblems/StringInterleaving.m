//
//  StringInterleaving.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "StringInterleaving.h"

@implementation StringInterleaving

// This doesn't handle duplicates like the one for ACDABC
+ (BOOL)isString:(NSString *)str interleavingOf:(NSString *)firstString andString:(NSString *)secondString
{
    // acdb, ab cd
    int i=0; int j=0; int k=0;
    
    while (k < str.length) {
        
        unichar strAtK = [str characterAtIndex:k];
        if (i < firstString.length) {
            unichar fStrAtK = [firstString characterAtIndex:i];
            if (strAtK == fStrAtK) {
                i++;
                k++;
                continue;
            }
        }
        
        if (j < secondString.length) {
            unichar sStrAtK = [secondString characterAtIndex:j];
            if (strAtK == sStrAtK) {
                j++;
                k++;
                continue;
            }
        }
        
        return NO;
    }
    
    return YES;
}

+ (BOOL)interleavingRec:(NSString *)str firstStr:(NSString *)fStr secondStr:(NSString *)sStr
{
    if (str.length == 0 && fStr.length == 0 && sStr.length == 0) {
        return YES;
    }
    
    if (str.length == 0) {
        return NO;
    }
    
    if (fStr.length > 0 && ([str characterAtIndex:0] == [fStr characterAtIndex:0]) && [self interleavingRec:[str substringFromIndex:1] firstStr:[fStr substringFromIndex:1]  secondStr:sStr]) {
        return [self interleavingRec:[str substringFromIndex:1] firstStr:[fStr substringFromIndex:1] secondStr:sStr];
    }
    
    if (sStr.length > 0 && ([str characterAtIndex:0] == [sStr characterAtIndex:0]) && [self interleavingRec:[str substringFromIndex:1] firstStr:fStr secondStr:[sStr substringFromIndex:1]]) {
        return [self interleavingRec:[str substringFromIndex:1] firstStr:fStr secondStr:[sStr substringFromIndex:1]];
    }
    
    return NO;
}


@end
