//
//  BST.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 30/04/21.
//

#import "BST.h"

@implementation BSTNode
- (instancetype)initWithData:(int)data left:(BSTNode  *_Nullable)left right:(BSTNode *_Nullable)right
{
    if (self = [super init]) {
        _data = data;
        _left = left;
        _right = right;
    }
    return self;
}
@end

/********************************************************/

@interface BST()
@property BSTNode *root;
@end

@implementation BST

- (instancetype)initWithRoot:(BSTNode *)root
{
    if (self = [super init]) {
        _root = root;
    }
    return self;
}

- (void) displayBST
{
    NSMutableArray *nodes = NSMutableArray.new;
    [self displayNode:self.root callback:^(int key) {
        [nodes addObject:@(key)];
    }];
    
    NSLog(@"Nodes are - %@", nodes);
}

- (void) displayNode:(BSTNode *)node callback:(void (^)(int key))nodeVisited
{
    if (node == nil) {
        return;
    }
    
    [self displayNode:node.left callback:nodeVisited];
    nodeVisited(node.data);
    [self displayNode:node.right callback:nodeVisited];
}

- (BSTNode *)insertNode:(int)key
{
    BSTNode *insertNode = [[BSTNode alloc] initWithData:key left:nil right:nil];
    BSTNode *node = [self getLeafNodeToInsertNode:insertNode node:self.root];
    return node;
}

- (BSTNode *)getLeafNodeToInsertNode:(BSTNode *)insertNode node:(BSTNode *)node
{
    if (node == nil) {
        return insertNode;
    }
    
    if (node.data > insertNode.data) {
        node.left = [self getLeafNodeToInsertNode:insertNode node:node.left];
    } else {
        node.right = [self getLeafNodeToInsertNode:insertNode node:node.right];
    }
    
    return node;
}

- (int)findSmallestElementInBST
{
    BSTNode *smallest = [self leftmostLeafNode:self.root];
    return smallest.data;
}

- (BSTNode *)leftmostLeafNode:(BSTNode *)node
{
    if (node.left) {
        return [self leftmostLeafNode:node.left];
    }
    
    return node;
}

+ (BOOL) isLevelOrderBST:(NSArray *)keys
{
    // @[@7, @4, @12, @3, @6, @8, @1, @5, @10];
    
    // 0 - root 2*i
    // 1 - left 2*i + 1
    // 2 - right 2*i + 2
    // 3, 4 left -> left, right 2*i + 1
    // 5, 6 rigth -> left, right
    
    BOOL isBST = YES;
    
    int height = (int) keys.count / 2 ;
    
    for (int i=0; i<= height; i++) {
        
        int node = ((NSNumber *)keys[i]).intValue;
        
        int leftIndex = 2*i + 1;
        int rightIndex = 2*i + 2;
        
        int leftKey = -1;
        int rightKey = -1;
        if (leftIndex < keys.count) {
            leftKey  = ((NSNumber *)keys[leftIndex]).intValue;
        }
        
        if (rightIndex < keys.count) {
            rightKey  = ((NSNumber *)keys[rightIndex]).intValue;
        }
        
        
        if ( (leftKey != -1 && leftKey > node) ||  (rightKey != -1 && rightKey < node) ) {
            return NO;
        }
        
    }
    
    
    return isBST;
}
@end
