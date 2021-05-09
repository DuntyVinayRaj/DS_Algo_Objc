//
//  SumOfDeepestNodes.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 09/05/21.
//

#import "SumOfDeepestNodes.h"
#import "Tree.h"
#import "Queue.h"

@implementation SumOfDeepestNodes

+ (int)getSumOfDeepestNodes:(NSArray *)tree
{
    int sum = 0;
    
    Tree *head = [[Tree alloc] initWithData:[self getData:tree[0]] left:nil right:nil];
    for (int i=1; i<tree.count; i++) {
        [SumOfDeepestNodes insert:tree[i] root:head];
    }
    
    int height = [head heightOfTree:head height:0];
    sum = [SumOfDeepestNodes getSumOfDeepestNodes:head level:0 height:height-1 sum:sum];
    
    NSLog(@"%@", [head printLevelOrder]);
    printf("\n");
    return sum;
}

+ (void)insert:(NSNumber *)data root:(Tree *)head
{
    Queue *q = [[Queue alloc] init];
    [q enqueueObject:head];
    
    while (q.itemCount > 0) {
        Tree *node = [q dequeueObject];
        
        // If left node does not exist then insert as left node
        if (!node.getLeftNode) {
            Tree *insertNode = [SumOfDeepestNodes getNodeWithData:data];
            [node addLeftNode:insertNode];
            return;
        }
        
        // If right node does not exist then insert as right node
        if (!node.getRightNode) {
            Tree *insertNode = [SumOfDeepestNodes getNodeWithData:data];
            [node addRightNode:insertNode];
            return;;
        }
        
        // If left node exists..
        // Chek if left node is already seen and marked as null so that it should not be processed further
        Tree *leftNode = node.getLeftNode;
        if (leftNode && (leftNode.getNodeData != -1)) {
            [q enqueueObject:leftNode];
        }

        // Do the same processing for right node
        Tree *rightNode = node.getRightNode;
        if (rightNode && (rightNode.getNodeData != -1)) {
            [q enqueueObject:rightNode];
        }
    }
}

+ (int)getSumOfDeepestNodes:(Tree *)head level:(int)level height:(int)height sum:(int)sum
{
    if (head == nil) {
        return sum;
    }
    
    if (level == height && (head.getNodeData != -1)) {
        return sum + head.getNodeData;
    }
    
    /**
     //    sum = [self getSumOfDeepestNodes:head.getLeftNode level:level+1 height:height sum:sum];
     //    sum = [self getSumOfDeepestNodes:head.getRightNode level:level+1 height:height sum:sum];
     // Can be written in a simple manner as above. But the idea is to make tail recursive so that the call stack is optimised
     */
    return [self getSumOfDeepestNodes:head.getLeftNode level:level+1 height:height sum:sum] +
            [self getSumOfDeepestNodes:head.getRightNode level:level+1 height:height sum:sum];
}

+ (Tree *)getNodeWithData:(NSNumber *)data
{
    return [[Tree alloc] initWithData:[self getData:data] left:nil right:nil];
}

+ (int)getData:(NSNumber *)number
{
    return number.intValue;
}

@end
