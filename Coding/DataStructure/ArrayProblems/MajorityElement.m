//
//  MajorityElement.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 26/04/21.
//

#import "MajorityElement.h"

@implementation MajorityElement

- (int)majorityElement:(NSArray<NSNumber *> *)arr
{
    NSNumber *majority = arr.firstObject;
    int count = 0;
    
    for (int i=1; i<arr.count; i++)
    {
        if (((NSNumber *)arr[i]).intValue == majority.intValue) {
            count++;
        } else {
            count = count-1;
            if (count == 0) {
                count = 1;
                majority = arr[i];
            }
        }
    }
    
    return majority.intValue;
}

@end
