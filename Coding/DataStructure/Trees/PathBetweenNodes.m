//
//  PathBetweenNodes.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 08/05/21.
//

#import "PathBetweenNodes.h"

@implementation PathBetweenNodes

+ (NSArray *)pathBetweenNode:(int)a andNode:(int)b root:(Tree *)root
{
    NSMutableArray *pathToA = NSMutableArray.new;
    [self pathToNode:a root:root path:&pathToA];
    
    NSMutableArray *pathToB = NSMutableArray.new;
    [self pathToNode:b root:root path:&pathToB];
    
    NSMutableArray *path = NSMutableArray.new;
    int intersection = [self getIntersectionPoint:pathToA andArray:pathToB];
    
    NSArray *aReveresed = [self getArrayInReverseOrder:pathToA.copy];
    
    for (int i=0; i<aReveresed.count-(intersection + 1); i++) {
        [path addObject:aReveresed[i]];
    }
    
    [path addObject:pathToA[intersection]];
    
    for (int i=intersection+1; i<pathToB.count; i++) {
        [path addObject:pathToB[i]];
    }
    
    return path;
}

+ (int)getIntersectionPoint:(NSArray *)a andArray:(NSArray *)b
{
    int intersection = -1;
    for (int i=0; i<a.count && i < b.count; i++) {
        int dataInA = ((NSNumber *)a[i]).intValue;
        int dataInB = ((NSNumber *)b[i]).intValue;
        if (dataInA == dataInB) {
            intersection = i;
        }
    }
    return intersection;
}

+ (NSArray *)getArrayInReverseOrder:(NSArray *)a
{
    return [[a reverseObjectEnumerator] allObjects];
}

+ (BOOL)pathToNode:(int)a root:(Tree *)root path:(NSMutableArray **)set
{
    if (!root) {
        return NO;
    }
    
    int nodeData = [root getNodeData];
    [(*set) addObject:@(nodeData)];
    
    if (nodeData == a) {
        return YES;
    }
    
    BOOL isFoundInLeftSubTree = [self pathToNode:a root:[root getLeftNode] path:set];
    BOOL isFoundInRightSubTree = [self pathToNode:a root:[root getRightNode] path:set];
    
    if (isFoundInLeftSubTree || isFoundInRightSubTree) {
        return YES;
    }
    
    [(*set) removeObject: @(nodeData)];
    return NO;
}

@end
