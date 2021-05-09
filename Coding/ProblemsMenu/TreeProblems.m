//
//  TreeProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 09/05/21.
//

#import "TreeProblems.h"
#import "BST.h"
#import "Tree.h"
#import "PathBetweenNodes.h"
#import "TreeZigZag.h"
#import "MirrorATree.h"
#import "PriorityQueue.h"

@implementation TreeProblems

- (Tree *)initializeTree
{
    Tree *head = [[Tree alloc] initWithData:0 left:nil right:nil];
    Tree *node1 = [[Tree alloc] initWithData:1 left:nil right:nil];
    Tree *node2 = [[Tree alloc] initWithData:2 left:nil right:nil];
    
    [head addLeftNode:node1];
    [head addRightNode:node2];
    
    Tree *node3 = [[Tree alloc] initWithData:3 left:nil right:nil];
    
    Tree *node4 = [[Tree alloc] initWithData:4 left:nil right:nil];
    Tree *node5 = [[Tree alloc] initWithData:5 left:nil right:nil];
    Tree *node6 = [[Tree alloc] initWithData:6 left:node5 right:node4];
    
    [node1 addRightNode:node3];
    [node1 addLeftNode:node6];
    
    Tree *node7 = [[Tree alloc] initWithData:7 left:nil right:nil];
    [node2 addRightNode:node7];
    
    return head;
}

- (void)printAttributesOfPQ:(PriorityQueue *)pq
{
    [pq display];
    NSLog(@"Max eleement is - %d", [pq maxElement]);
}

+ (void)treeProblemsMenu
{
    NSInteger choice = 1;
    
    switch (choice) {
        case 1:
        {
            BSTNode *node = [[BSTNode alloc] initWithData:5 left:nil right:nil];
            BST *bst = [[BST alloc] initWithRoot:node];
            
            [bst insertNode:4];
            [bst insertNode:6];
            [bst insertNode:1];
            [bst insertNode:3];
            [bst insertNode:7];
            
            //[bst displayBST];
            int smallestElement = [bst findSmallestElementInBST];
            NSLog(@"Smallest element in bst is %d", smallestElement);
            
            
            NSArray *levelOrderCheck= @[@7, @4, @12, @3, @6, @8, @1, @5, @10];
            BOOL isBST = [BST isLevelOrderBST:levelOrderCheck];
            NSLog(@"Is array level order BST - %d", isBST);
        }
            break;
        case 2:
        {
            Tree *head = [[TreeProblems alloc] initializeTree];
            NSLog(@"Level order is \n");
            NSLog(@"%@", [head printLevelOrder]);
            NSLog(@"Zig Zag order is \n");
            [TreeZigZag printTreeNodesInZigZagOrder:head];
        }
            break;
        case 3:
        {
            Tree *head = [[TreeProblems alloc] initializeTree];
            
            NSArray *path = [PathBetweenNodes pathBetweenNode:6 andNode:2 root:head];
            NSLog(@"Path is %@", path);
            
            NSArray *path1 = [PathBetweenNodes pathBetweenNode:6 andNode:3 root:head];
            NSLog(@"Path is %@", path1);
            
            NSArray *path2 = [PathBetweenNodes pathBetweenNode:5 andNode:3 root:head];
            NSLog(@"Path is %@", path2);
            
            NSArray *path3 = [PathBetweenNodes pathBetweenNode:7 andNode:3 root:head];
            NSLog(@"Path is %@", path3);
            
            NSArray *path4 = [PathBetweenNodes pathBetweenNode:4 andNode:3 root:head];
            NSLog(@"Path is %@", path4);
        }
            break;
        case 4:
        {
            Tree *head = [[TreeProblems alloc] initializeTree];
            printf("Before mirroring\n");
            [head display];
            printf("\n");
            [MirrorATree mirrorOfATree:head];
            printf("After mirroring \n");
            [head display];
            printf("\n");
        }
            break;
        case 5:
        {
            TreeProblems *sol = [[TreeProblems alloc] init];
            PriorityQueue *pq = [[PriorityQueue alloc] init];
            [pq insertElement:3];
            [pq insertElement:1];
            [pq insertElement:2];
            [pq insertElement:5];
            [pq insertElement:10];
            [pq insertElement:7];
            [pq insertElement:6];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
            
            [pq deleteMax];
            [sol printAttributesOfPQ:pq];
        }
            break;
        default:
            break;
    }
}

@end
