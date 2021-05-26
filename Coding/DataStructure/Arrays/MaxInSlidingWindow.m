//
//  MaxInSlidingWindow.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 14/05/21.
//

#import "MaxInSlidingWindow.h"
#import "MaxQueue.h"

@implementation MaxInSlidingWindow

+ (NSArray *)findMaxElementsIn:(NSArray *)ipArray ofWindow:(int)windowSize
{
    NSMutableArray *result = NSMutableArray.new;
    
    MaxQueue *q = [[MaxQueue alloc] init];
    
    for (int i=0; i<windowSize; i++) {
        [q enqueueInt:((NSNumber *)ipArray[i]).intValue];
    }
    
    [result addObject:@(q.maxElement)];
    
    for (int i=windowSize; i<ipArray.count; i++) {
        [q dequeueInt];
        [q enqueueInt:((NSNumber *)ipArray[i]).intValue];
        [result addObject:@(q.maxElement)];
    }
    
    return result;
}

@end
