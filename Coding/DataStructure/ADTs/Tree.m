//
//  Tree.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "Tree.h"
#import "Queue.h"

@interface Tree()
@property Tree *left;
@property Tree *right;
@property int data;
@end

@implementation Tree

- (instancetype)initWithData:(int)data left:(Tree *_Nullable)left right:(Tree *_Nullable)right
{
    if (self = [super init]) {
        _left = left;
        _right = right;
        _data = data;
    }
    return self;
}

- (void)addLeftNode:(Tree *)left
{
    self.left = left;
}

- (void)addRightNode:(Tree *)right
{
    self.right = right;
}

- (int)getNodeData
{
    return self.data;
}

- (Tree *)getLeftNode
{
    return self.left;
}

- (Tree *)getRightNode
{
    return self.right;
}

- (int)getLevelOfNode:(Tree *)head
{
    int level = [self levelOfNodeFromHead:head level:0];
    return level;
}

- (int)levelOfNodeFromHead:(Tree *)node level:(int)level
{
    if (node == nil) {
        return -1;
    }
    
    if ((node.data == self.data)) {
        return level;
    }
    
    int downLevel = [self levelOfNodeFromHead:node.left level:level+1];
    
    if (downLevel == -1) {
        downLevel = [self levelOfNodeFromHead:node.right level:level+1];
    }
    
    return downLevel;
}

- (void)display
{
    [self printInOrder:self];
}

- (void)printInOrder:(Tree *)node
{
    if (node == nil) {
        return;
    }
    
    [self printInOrder:node.left];
    printf("%d \t", node.data);
    [self printInOrder:node.right];
}

- (NSString *)printLevelOrder
{
    NSString *zigZag = @"";
    Queue *q = [[Queue alloc] init];
    [q enqueueObject:self];
    while (q.itemCount > 0) {
        Tree *node = [q dequeueObject];
        zigZag = [zigZag stringByAppendingFormat:@"%d \t", node.getNodeData];
        Tree *leftNode = [node getLeftNode];
        Tree *rightNode = [node getRightNode];
        [q enqueueObject:leftNode];
        [q enqueueObject:rightNode];
    }
    return zigZag;
}

- (int)heightOfTree:(Tree *)head height:(int)height
{
    if (head == nil) {
        return height;
    }
    return MAX([self heightOfTree:head.getLeftNode height:height+1],
               [self heightOfTree:head.getRightNode height:height+1]);
}

@end
