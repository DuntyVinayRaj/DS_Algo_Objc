//
//  main.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 21/04/21.
//

#import <Foundation/Foundation.h>
#import "ExpressionEvaluation.h"
#import "LongestPalindromeSS.h"
#import "MajorityElement.h"
#import "MergeSort.h"
#import "RearrangePositiveNegative.h"
#import "InversionCount.h"
#import "QuickSort.h"
#import "QuickSelect.h"
#import "PriorityQueue.h"
#import "BST.h"
#import "AllSubSequences.h"
#import "DataStructure/ADTs/GraphADT.h"
#import "DataStructure/Graphs/GraphDFS.h"
#import "DataStructure/Graphs/GraphBFS.h"
#import "DataStructure/Trees/TreeZigZag.h"
#import "DataStructure/Trees/PathBetweenNodes.h"

// Wrap practice methods here
@interface Solutions : NSObject
- (void)printAttributesOfPQ:(PriorityQueue *)pq;
@end

@implementation Solutions
- (void)printAttributesOfPQ:(PriorityQueue *)pq
{
    [pq display];
    NSLog(@"Max eleement is - %d", [pq maxElement]);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int choice = 15;
        switch (choice) {
            case 1:
            {
                NSString *testSeq = @"a101a";
                NSString *longestSeq = [[[LongestPalindromeSS alloc] init] findLongestPalindromicSubSequence:testSeq];
                NSLog(@"Longest subsequence - %@", longestSeq);
            }
                break;
            case 2:
            {
                NSString *expres1 = @"(1+((2+3)*(4*5)))";
                //NSString *expres2 = @"(1((23+)(45*)*)+)";
                ExpressionEvaluation *eval = [[ExpressionEvaluation alloc] init];
                BOOL isValid = [eval evaluateExpression:expres1];
                NSLog(@"Is valid - %d", isValid);
            }
                break;
            case 3 :
            {
                // insert code here...
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
            case 4:
            {
                NSArray *testVal = @[@3, @2, @3];
                int major = [[[MajorityElement alloc] init] majorityElement:testVal];
                NSLog(@"Majority element is - %d", major);
            }
                break;
            case 5:
            {
                NSString *testSeq = @"a101a";
                NSString *longestSeq = [[[LongestPalindromeSS alloc] init] findLongestPalindromicSubSequenceDP:testSeq];
                NSLog(@"Longest subsequence - %@", longestSeq);
            }
                break;
            case 6:
            {
                NSArray *ip = @[@3, @1, @4, @2];
                ip = [[[MergeSort alloc] init] sortArray:ip];
                NSLog(@"%@", ip);
            }
                break;
            case 7:
            {
                NSArray *ip = @[@12, @11, @-13, @-5, @6, @-7, @5, @-3, @-6]; //@[@1, @-2, @3, @-3, @4, @-1];
                ip = [[[RearrangePositiveNegative alloc] init] rearrangeNumbers:ip];
                NSLog(@"%@", ip);
            }
                break;
            case 8:
            {
                NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
                int count = [[[InversionCount alloc] init] inversionCountUsingMS:ip];
                NSLog(@"%d", count);
            }
                break;
            case 9:
            {
                NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
                ip = [[[QuickSort alloc] init] sortArray:ip];
                NSLog(@"%@", ip);
            }
                break;
            case 10:
            {
                NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
                int largest = [[[QuickSelect alloc] init] findKth:5 largestInArray:ip];
                NSLog(@"%d", largest);
            }
                break;
            case 11:
            {
                Solutions *sol = [[Solutions alloc] init];
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
            case 12:
            {
                [AllSubSequences printAllSubsequencesOf:@"abc"];
            }
                break;
            case 13:
            {
                
                GraphADT *graphADT = [[GraphADT alloc] initWithVertices:4];
                [graphADT addEdge:0 toV2:1];
                [graphADT addEdge:0 toV2:2];
                [graphADT addEdge:2 toV2:0];
//                [graphADT addEdge:2 toV2:3];
                [graphADT addEdge:3 toV2:3];
                
                NSLog(@"%@", [graphADT dsiplayGraph]);
                
                [GraphDFS DepthFirstPaths:graphADT source:0];
                [GraphBFS BreadthFirstPaths:graphADT source:2];
                
                GraphDFS *gDFS = [[GraphDFS alloc] initWithgraph:graphADT source:0];
                int vertex1 = 2;
                int vertex2 = 3;
                BOOL isConnected = [gDFS isVertex:vertex1 connectedTo:vertex2];
                NSLog(@"Vertex %d is connected to %d ? - %d", vertex1, vertex2, isConnected);
            }
                break;
            case 14:
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
                
                [TreeZigZag printTreeNodesInZigZagOrder:head];
                
            }
                break;
            case 15:
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
            default:
                break;
        }

    }
    return 0;
}
