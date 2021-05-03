//
//  AllSubSequences.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 02/05/21.
//

#import "AllSubSequences.h"

@implementation AllSubSequences

+ (void)printSubSequences:(NSString *)ipString outString:(NSString *)outString
{
    if (ipString.length == 0) {
        if (outString.length > 0) {
            NSLog(@"Output is - %@", outString);
        }
        return;
    }
    
    [self printSubSequences:[ipString substringFromIndex:1] outString:[outString stringByAppendingString:[ipString substringToIndex:1]]];
    [self printSubSequences:[ipString substringFromIndex:1] outString:outString];
}

+ (void)printAllSubsequencesOf:(NSString *)str
{
    [self printSubSequences:str outString:@""];
}

@end
