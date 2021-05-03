//
//  PriorityQueue.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 29/04/21.
//

#import "PriorityQueue.h"

@interface PQNode : NSObject
@property int data;
@end

@implementation PQNode
- (instancetype)initWithData:(int)data
{
    if (self = [super init]) {
        _data = data;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d", self.data];
}

@end

/**********************************/

@interface PriorityQueue()
@property NSMutableArray *pq;
@end

@implementation PriorityQueue

- (instancetype)init
{
    if (self = [super init]) {
        _pq = NSMutableArray.new;
    }
    return self;
}

- (PQNode *)getPQNodeForData:(int)element
{
    PQNode *node = [[PQNode alloc] init];
    node.data = element;
    return node;
}

#pragma mark PQ crud operations

- (void)insertElement:(int)element
{
    PQNode *node = [self getPQNodeForData:element];
    [self.pq addObject:node];
    [self swim: self.pq.count-1];
}

- (void)deleteMax
{
    if ([self isEmpty]) {
        return;
    }
    
    [self swapIn:self.pq indeOf:0 withIndex:self.pq.count-1];
    [self.pq removeLastObject];
    [self sink];
}

- (int)sizeOfElements
{
    return (int)self.pq.count;
}

- (int)maxElement
{
    PQNode *maxNode = self.pq.firstObject;
    return maxNode.data;
}

- (BOOL)isEmpty
{
    return self.pq.count <= 0;
}

- (void)display
{
    NSLog(@"Priority queue is - %@", self.pq);
}

#pragma mark PQ sink and swim operations

- (void)swim:(NSInteger)index
{
    while ([self dataAtIndex:index] > 0 && ([self dataAtIndex:index/2] < [self dataAtIndex:index])) {
        [self swapIn:self.pq indeOf:index withIndex:index/2];
        index = index/2;
    }
}

- (void)sink
{
    int index = 0;
    
    while ((2*index + 1) < self.pq.count) {
        int j = 2*index+1;
        int indexOfChild = [self getIndexOfChild:j];
        
        if (!([self dataAtIndex:index] < [self dataAtIndex:indexOfChild])) {
            break;
        }
        
        [self swapIn:self.pq indeOf:index withIndex:indexOfChild];
        index = indexOfChild;
        
    }

}

- (NSMutableArray *)swapIn:(NSMutableArray *)array indeOf:(NSInteger)sIndex withIndex:(NSInteger)dIndex
{
    id objectAtdIndex = array[dIndex];
    id objectAtsIndex = array[sIndex];
    
    array[dIndex] = objectAtsIndex;
    array[sIndex] = objectAtdIndex;
    
    return array;
}

- (BOOL) isNode:(PQNode *)node1 lessThan:(PQNode *)node2
{
    return node1.data < node2.data;
}

- (int)dataAtIndex:(NSInteger)index
{
    return ((PQNode *)self.pq[index]).data;
}

- (int)getIndexOfChild:(int)index
{
    if (index + 1 < [self sizeOfElements]) {
        if ([self dataAtIndex:index+1] > [self dataAtIndex:index]) {
            return index+1;
        }
    }

    return index;
}

@end
