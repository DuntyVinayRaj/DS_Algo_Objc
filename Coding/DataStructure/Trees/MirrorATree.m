//
//  MirrorATree.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 09/05/21.
//

#import "MirrorATree.h"

@implementation MirrorATree

+ (void)mirrorOfATree:(Tree *)treeNode
{
    // Assuming the node is head. We start recursively creating mirrors of sub trees
    [MirrorATree mirrorANode:treeNode];
}

+ (void)mirrorANode:(Tree *)treeNode
{
    if (treeNode == nil) {
        return;
    }
    
    Tree *temp = [treeNode getLeftNode];
    [treeNode addLeftNode:[treeNode getRightNode]];
    [treeNode addRightNode:temp];
    
    [self mirrorANode:[treeNode getLeftNode]];
    [self mirrorANode:[treeNode getRightNode]];
}

@end
