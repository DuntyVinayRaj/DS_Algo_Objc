//
//  MinQueue.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 14/05/21.
//

#import "MinQueue.h"

@interface MinQueue()
@property int min;
@end

@implementation MinQueue

- (instancetype)init
{
    if (self = [super init]) {
        _min = INT8_MAX;
    }
    return self;
}

- (void)enqueueInt:(int)item
{
    if (self.itemCount == 0) {
        self.min = item;
    } else if ([self isElement:item lesserThanMin:self.minElement]) {
        item = [self transformedElement:item forMin:self.min];
        self.min = item;
    }
    [super enqueueInt:item];
}

- (int)dequeueInt
{
    int element = [super dequeueInt];
    self.min = [self getNextMinElement:element minElement:self.minElement];
    return element;
}

- (int)minElement
{
    return self.min;
}

- (int)transformedElement:(int)element forMin:(int)minElement
{
    return minElement - (2 * element);
}

- (BOOL)isElement:(int)element lesserThanMin:(int)minElement
{
    return (element < minElement);
}

- (int)getNextMinElement:(int)element minElement:(int)min
{
    if (element <= min) {
        // min is popped.
        return (2*min) + element;
    }
    return min;
}

@end
