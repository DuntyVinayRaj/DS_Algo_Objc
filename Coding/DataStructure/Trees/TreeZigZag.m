//
//  TreeZigZag.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "TreeZigZag.h"
#import "Queue.h"

@interface TreeZigZag()
@end

@implementation TreeZigZag

+ (void)printTreeNodesInZigZagOrder:(Tree *)head
{
    NSString *zigZag = @"";
    Queue *q = [[Queue alloc] init];
    
    [q enqueueObject:head];
    
    while (q.itemCount > 0) {
        
        Tree *node = [q dequeueObject];
        zigZag = [zigZag stringByAppendingFormat:@" %d", node.getNodeData];
        
        Tree *leftNode = [node getLeftNode];
        Tree *rightNode = [node getRightNode];
        
        int level = [node getLevelOfNode:head];
        
        
        
        if ((level % 2) == 0) {
            if (rightNode) {
                [q enqueueObject:rightNode];
            }
            
            if (leftNode) {
                [q enqueueObject:leftNode];
            }
        } else {
            
            if (leftNode) {
                [q enqueueObject:leftNode];
            }
            
            if (rightNode) {
                [q enqueueObject:rightNode];
            }
        }
        
    }
    
    NSLog(@"%@", zigZag);
    
}

@end
