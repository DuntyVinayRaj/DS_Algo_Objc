//
//  RearrangePositiveNegative.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 27/04/21.
//

#import "RearrangePositiveNegative.h"

@implementation RearrangePositiveNegative

// Using constant space
- (NSArray *)rearrangeNumbers:(NSArray *)ipArr
{
    NSMutableArray *sorting = ipArr.mutableCopy;
    for (int i=1; i<sorting.count; i++) {
        NSNumber *numberAtIndex = sorting[i];
        if (numberAtIndex.intValue < 0) {
            int j = i-1;
            while (j >= 0 && ((NSNumber *)sorting[j]).intValue >= 0) {
                NSNumber *prevVal = sorting[j];
                sorting[j] = sorting[j+1];
                sorting[j+1] = prevVal;
                j--;
            }
        }
    }
    return sorting;
}

@end
