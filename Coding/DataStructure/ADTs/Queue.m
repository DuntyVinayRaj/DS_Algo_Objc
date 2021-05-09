//
//  Queue.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "Queue.h"

@interface Queue()
@property NSArray *items;
@end

@implementation Queue

- (void)enqueueInt:(int)item
{
    if (!self.items) {
        self.items = NSArray.new;
    }
    
    [self enqueueObject:@(item)];
}

- (void)enqueueObject:(id)object
{
    if (!self.items) {
        self.items = NSArray.new;
    }
    NSMutableArray *itemsM = self.items.mutableCopy;
    [itemsM addObject:object];
    self.items = itemsM.copy;
}

- (int)dequeueInt
{
    id object = [self dequeueObject];
    int item = ((NSNumber *)object).intValue;
    return item;
}

- (id)dequeueObject
{
    NSMutableArray *itemsM = self.items.mutableCopy;
    id object = itemsM.firstObject;
    [itemsM removeObjectAtIndex:0];
    self.items = itemsM.copy;
    return object;
}

- (NSArray *)itemsInQueue
{
    return self.items;
}

- (NSInteger)itemCount
{
    return self.items.count;
}
@end
