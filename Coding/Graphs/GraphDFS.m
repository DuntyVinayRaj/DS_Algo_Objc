//
//  GraphDFS.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import "GraphDFS.h"

@interface GraphDFS()
@property GraphADT *graph;
@property int source;

@property NSArray *marked;
@property NSString *dfsPath;
@end

@implementation GraphDFS

- (instancetype)initWithgraph:(GraphADT *)graph source:(int)source
{
    if (self = [super init]) {
        _graph = graph;
        _source = source;
        _dfsPath = @"";
        
        NSMutableArray *markedM = NSMutableArray.new;
        for (int i=0; i<graph.vertices; i++) {
            markedM[i] = @(NO);
        }
        _marked = markedM.copy;
    }
    return self;
}

+ (void)DepthFirstPaths:(GraphADT *)graph source:(int)source
{
    GraphDFS *dfs = [[GraphDFS alloc] initWithgraph:graph source:source];
    [dfs dfs:source];
    NSLog(@"DFS for given graph is");
    NSLog(@"%@", dfs.dfsPath);
}

- (void)dfs:(int)vertex
{
    NSMutableArray *markedM = [self.marked mutableCopy];
    markedM[vertex] = @(1);
    self.marked = markedM;
    self.dfsPath = [self.dfsPath stringByAppendingFormat:@" -> %d",vertex];
    
    NSArray *adjVertices = [self.graph adjacentVerticesToVetex:vertex];
    for (NSNumber *adjVertex in adjVertices) {
        BOOL isMarked = ((NSNumber *)self.marked[adjVertex.intValue]).boolValue;
        if (!isMarked) {
            [self dfs:adjVertex.intValue];
        }
    }
}

@end
