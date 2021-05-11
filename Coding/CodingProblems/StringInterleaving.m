//
//  StringInterleaving.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "StringInterleaving.h"

@implementation StringInterleaving

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

@end
