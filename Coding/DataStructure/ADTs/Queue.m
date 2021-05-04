//
//  Queue.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "Queue.h"

@interface Queue()
@property NSArray *vertexQueue;
@end

@implementation Queue
- (void)enqueue:(int)vertex
{
    if (!self.vertexQueue) {
        self.vertexQueue = NSArray.new;
    }
    NSMutableArray *vertexQueueM = self.vertexQueue.mutableCopy;
    [vertexQueueM addObject:@(vertex)];
    self.vertexQueue = vertexQueueM.copy;
}

- (int)dequeue
{
    NSMutableArray *vertexQueueM = self.vertexQueue.mutableCopy;
    int vertex = ((NSNumber *)[vertexQueueM firstObject]).intValue;
    [vertexQueueM removeObjectAtIndex:0];
    self.vertexQueue = vertexQueueM.copy;
    return vertex;
}

- (NSArray *)itemsInQueue
{
    return self.vertexQueue;
}

- (NSInteger)itemCount
{
    return self.vertexQueue.count;
}
@end
