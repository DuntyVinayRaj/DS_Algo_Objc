//
//  TreeZigZag.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "TreeZigZag.h"
#import "MyStack.h"
#import "Queue.h"

@implementation TreeZigZag
+ (void)printTreeNodesInZigZagOrder:(Tree *)head
{
    NSString *zigZag = @"";
    Queue *q = [[Queue alloc] init];
    MyStack *s = [[MyStack alloc] init];
    
    [q enqueueObject:head];
    while (q.itemCount > 0) {
        Tree *node = [q dequeueObject];
        int level = [node getLevelOfNode:head];
        
        Tree *leftNode = [node getLeftNode];
        Tree *rightNode = [node getRightNode];
        
        if ((level % 2) == 0) {
            zigZag = [zigZag stringByAppendingFormat:@"%d \t", node.getNodeData];
            [s push:leftNode];
            [s push:rightNode];
        } else {
            Tree *node = s.pop;
            while (node) {
                zigZag = [zigZag stringByAppendingFormat:@"%d \t", node.getNodeData];
                node = s.pop;
            }
        }
        
        [q enqueueObject:leftNode];
        [q enqueueObject:rightNode];
    }
    NSLog(@"%@", zigZag);
}
@end
