//
//  StringInterleavingDP.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "StringInterleavingDP.h"

@implementation StringInterleavingDP

+ (BOOL)interleavingRec:(NSString *)str firstStr:(NSString *)fStr secondStr:(NSString *)sStr
{
    return [self interleavingRec:str firstStr:fStr secondStr:sStr map:NSMutableDictionary.new];
}

+ (BOOL)interleavingRec:(NSString *)str firstStr:(NSString *)fStr secondStr:(NSString *)sStr map:(NSMutableDictionary *)map
{
    if (str.length == 0 && fStr.length == 0 && sStr.length == 0) {
        return YES;
    }
    
    if (str.length == 0) {
        return NO;
    }
    
    NSString *key = [str stringByAppendingFormat:@"|%@|%@", fStr, sStr];
    
    // See if the sub problem is already solved. If so return the value
    if (!map[key]) {
        BOOL solveForFirstString = (fStr.length > 0 && ([str characterAtIndex:0] == [fStr characterAtIndex:0]) && [self interleavingRec:[str substringFromIndex:1] firstStr:[fStr substringFromIndex:1]  secondStr:sStr]);
        
        BOOL solveForSecondString = solveForFirstString || (sStr.length > 0 && ([str characterAtIndex:0] == [sStr characterAtIndex:0]) && [self interleavingRec:[str substringFromIndex:1] firstStr:fStr  secondStr:[sStr substringFromIndex:1]]);
            
        if (solveForFirstString || solveForSecondString) {
            map[key] = @(1);
        }
    }
    
    return ((NSNumber *)map[key]).boolValue;
}

+ (BOOL)interleavingBU:(NSString *)str firstStr:(NSString *)fStr secondStr:(NSString *)sStr
{
    NSInteger stringLength = str.length;
    NSInteger fKeyLength = fStr.length;
    NSInteger sKeyLength = sStr.length;
    
    // If lengths doesn't add up then return NO
    if (stringLength != (fKeyLength + sKeyLength)) {
        return NO;
    }
    
    NSMutableArray <NSMutableArray <NSNumber *> *> *T = NSMutableArray.new;
    for (int i=0; i<=fKeyLength; i++) {
        NSMutableArray *i = NSMutableArray.new;
        for (int j=0; j<=sKeyLength; j++) {
            [i addObject:@(0)];
        }
        [T addObject:i];
    }
    
    for (int i=0; i<=fKeyLength; i++) {
        for (int j=0; j<=sKeyLength; j++) {
            if (i == 0 && j == 0) {
                // If both keys are empty then true
                T[i][j] = @(1);
            }else if (i > 0 && j > 0 &&
                ([fStr characterAtIndex:i-1] == [str characterAtIndex:i+j-1]) &&
                ([sStr characterAtIndex:j-1] == [str characterAtIndex:i+j-1]))
            {
                if ([self getBoolValue:T[i-1][j]] || [self getBoolValue:T[i][j-1]]) {
                    T[i][j] = @(1);
                }
            } else if (i > 0 && [fStr characterAtIndex:i-1] == [str characterAtIndex:i+j-1]) {
                T[i][j] = T[i-1][j];
            } else if (j > 0 && [sStr characterAtIndex:j-1] == [str characterAtIndex:i+j-1]) {
                T[i][j] = T[i][j-1];
            }
        }
    }
    
    return T[fKeyLength][sKeyLength].boolValue;
}

+ (BOOL)getBoolValue:(NSNumber *)number
{
    return number.boolValue;
}

@end
