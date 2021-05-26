//
//  MaxQueue.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 14/05/21.
//

#import "MaxQueue.h"

@interface MaxQueue()
@property int max;
@end

@implementation MaxQueue

- (instancetype)init
{
    if (self = [super init]) {
        _max = -1;
    }
    return self;
}

- (void)enqueueInt:(int)item
{
    if ([self isElement:item greaterThanMax:self.maxElement]) {
        item = [self transformedElement:item forMax:self.max];
        self.max = item;
    }
    [super enqueueInt:item];
}

- (int)dequeueInt
{
    int element = [super dequeueInt];
    self.max = [self getNextMaxElement:element maxElement:self.maxElement];
    return element;
}

- (int)maxElement
{
    return self.max;
}

- (int)transformedElement:(int)element forMax:(int)maxElement
{
    return (2 * element) - maxElement;
}

- (BOOL)isElement:(int)element greaterThanMax:(int)maxElement
{
    return (element > maxElement);
}

- (int)getNextMaxElement:(int)element maxElement:(int)max
{
    if (element > max) {
        // max is popped.
        return (2*max) - element;
    }
    return max;
}

@end
