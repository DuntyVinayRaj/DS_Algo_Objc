//
//  GraphBFS.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import "GraphBFS.h"
#import "Queue.h"

@interface GraphBFS()
@property GraphADT *graph;
@property int source;
@property Queue *bfsQueue;
@property NSArray *marked;
@property NSString *bfsPath;
@end

@implementation GraphBFS

- (instancetype)initWithgraph:(GraphADT *)graph source:(int)source
{
    if (self = [super init]) {
        _graph = graph;
        _source = source;
        _bfsPath = @"";
        _bfsQueue = [[Queue alloc] init];
        
        NSMutableArray *markedM = NSMutableArray.new;
        for (int i=0; i<graph.vertices; i++) {
            markedM[i] = @(NO);
        }
        _marked = markedM.copy;
    }
    return self;
}

+ (void)BreadthFirstPaths:(GraphADT *)graph source:(int)source
{
    GraphBFS *bfs = [[GraphBFS alloc] initWithgraph:graph source:source];
    [bfs bfs:source];
    NSLog(@"BFS for given graph is");
    NSLog(@"%@", bfs.bfsPath);
}

- (void)bfs:(int)vertex
{
    [self markVertex:vertex];
    [self.bfsQueue enqueueInt:vertex];
    
    while ([self.bfsQueue itemCount] > 0) {
        int dequeueVertex = [self.bfsQueue dequeueInt];
        
        self.bfsPath = [self.bfsPath stringByAppendingFormat:@" -> %@", @(dequeueVertex)];
        NSArray *adjVertices = [self.graph adjacentVerticesToVetex:dequeueVertex];
    
        for (NSNumber *vertex in adjVertices) {
            if (![self isVertexMarked:vertex.intValue]) {
                [self markVertex:vertex.intValue];
                [self.bfsQueue enqueueInt:vertex.intValue];
            }
        }
        
    }
}

#pragma mark Vertex Marking functions

- (void)markVertex:(int)vertex
{
    NSMutableArray *markedM = [self.marked mutableCopy];
    markedM[vertex] = @(1);
    self.marked = markedM;
}

- (BOOL) isVertexMarked:(int)vertex
{
    NSNumber *marked = self.marked[vertex];
    return marked.boolValue;
}

@end
