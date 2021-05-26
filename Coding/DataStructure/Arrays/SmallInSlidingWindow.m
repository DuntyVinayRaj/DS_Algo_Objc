//
//  SmallInSlidingWindow.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 14/05/21.
//

#import "SmallInSlidingWindow.h"
#import "MinQueue.h"

@implementation SmallInSlidingWindow

+ (NSArray *)findMinElementsIn:(NSArray *)ipArray ofWindow:(int)windowSize
{
    NSMutableArray *result = NSMutableArray.new;
    
    MinQueue *q = [[MinQueue alloc] init];
    
    for (int i=0; i<windowSize; i++) {
        [q enqueueInt:((NSNumber *)ipArray[i]).intValue];
    }
    
    [result addObject:@(q.minElement)];
    
    for (int i=windowSize; i<ipArray.count; i++) {
        [q dequeueInt];
        [q enqueueInt:((NSNumber *)ipArray[i]).intValue];
        [result addObject:@(q.minElement)];
    }
    
    return result;
}

@end
