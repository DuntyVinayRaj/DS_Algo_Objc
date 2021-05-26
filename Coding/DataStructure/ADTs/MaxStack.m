//
//  MaxStack.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 14/05/21.
//

#import "MaxStack.h"

/* MAX STACK
 
 Push(x) : Inserts x at the top of stack.

 If stack is empty, insert x into the stack and make maxEle equal to x.
 If stack is not empty, compare x with maxEle. Two cases arise:
 If x is less than or equal to maxEle, simply insert x.
 If x is greater than maxEle, insert (2*x – maxEle) into the stack and make maxEle equal to x. For example, let previous maxEle was 3. Now we want to insert 4. We update maxEle as 4 and insert 2*4 – 3 = 5 into the stack.
 Pop() : Removes an element from top of stack.

 Remove element from top. Let the removed element be y. Two cases arise:
 If y is less than or equal to maxEle, the maximum element in the stack is still maxEle.
 If y is greater than maxEle, the maximum element now becomes (2*maxEle – y), so update (maxEle = 2*maxEle – y). This is where we retrieve previous maximum from current maximum and its value in stack. For example, let the element to be removed be 5 and maxEle be 4. We remove 5 and update maxEle as 2*4 – 5 = 3.
 
 Stack doesn’t hold actual value of an element if it is maximum so far.
 Actual maximum element is always stored in maxEle
 
 */

@interface MaxStack()
@property NSNumber *max;
@end

@implementation MaxStack

- (instancetype)init
{
    if (self = [super init]) {
        _max = @(-1);
    }
    return self;
}

- (void)push:(id)element
{
    if ([element isKindOfClass:NSNumber.class]) {
        if ([self isElement:element greaterThanMax:self.maxElement]) {
            [super push:[self transformedElement:element forMax:self.max]];
            self.max = element;
        }
    }
}

- (id)pop
{
    id element = [super pop];
    self.max = [self getNextMaxElement:element maxElement:self.maxElement];
    return element;
}

- (NSNumber *)maxElement
{
    return self.max;
}

- (id)transformedElement:(id)element forMax:(id)maxElement
{
    NSNumber *tranform = @(((2 * ((NSNumber *)element).intValue) - ((NSNumber *)maxElement).intValue));
    return tranform;
}

- (BOOL)isElement:(id)element greaterThanMax:(id)maxElement
{
    if ([element isKindOfClass:NSNumber.class] && [maxElement isKindOfClass:NSNumber.class]) {
        if ( ((NSNumber *)element).intValue > ((NSNumber *)maxElement).intValue ) {
            return YES;
        }
    }
    return NO;
}

- (id)getNextMaxElement:(id)element maxElement:(id)max
{
    if (((NSNumber *)element).intValue > ((NSNumber *)max).intValue) {
        // max is popped.
        return @((2*((NSNumber *)max).intValue) - ((NSNumber *)element).intValue);
    }
    return max;
}

@end
