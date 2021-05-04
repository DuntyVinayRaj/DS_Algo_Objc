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
@property NSArray *connected;
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
        
        NSMutableArray *connectedM = NSMutableArray.new;
        for (int i=0; i<graph.vertices; i++) {
            connectedM[i] = @-1;
        }
        _connected = connectedM.copy;
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
    [self markVertex:vertex];
    self.dfsPath = [self.dfsPath stringByAppendingFormat:@" -> %d",vertex];
    
    NSArray *adjVertices = [self.graph adjacentVerticesToVetex:vertex];
    for (NSNumber *adjVertex in adjVertices) {
        BOOL isMarked = ((NSNumber *)self.marked[adjVertex.intValue]).boolValue;
        if (!isMarked) {
            [self dfs:adjVertex.intValue];
        }
    }
}

- (void)dfsWithConnectivity:(int)vertex
{
    NSMutableArray *markedM = [self.marked mutableCopy];
    markedM[vertex] = @(1);
    self.marked = markedM;
    
    NSArray *adjVertices = [self.graph adjacentVerticesToVetex:vertex];
    for (NSNumber *adjVertex in adjVertices) {
        if (![self isVertexMarked:adjVertex.intValue]) {
            [self updateConnectivityOfVertex:adjVertex.intValue withSource:vertex];
            [self dfsWithConnectivity:adjVertex.intValue];
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

#pragma mark Graph Connectivity

- (void)updateConnectivityOfVertex:(int)vertex withSource:(int)source
{
    NSMutableArray *connectedM = self.connected.mutableCopy;
    connectedM[vertex] = connectedM[source];
    self.connected = connectedM.copy;
}

- (void)updateConnectivityOfVertex:(int)vertex withValue:(int)value
{
    NSMutableArray *connectedM = self.connected.mutableCopy;
    connectedM[vertex] = @(value);
    self.connected = connectedM.copy;
}

- (BOOL)isVertex:(int)v1 connectedTo:(int)v2
{
    [self updateConnectivityOfVertex:v1 withValue:v1];
    [self dfsWithConnectivity:v1];
    
    for (int i=0; i<self.graph.vertices; i++) {
        if (![self isVertexMarked:i]) {
            [self dfsWithConnectivity:i];
        }
    }
    
    // Check if the connectivity values for v1 and v2 are same.
    BOOL isConnected = NO;
    if (self.connected[v1] == self.connected[v2]) {
        isConnected = YES;
    }
    
    return isConnected;
}

#pragma mark Undirected graphs Cyles

- (BOOL)isCyclic:(GraphADT *)graph source:(int)source
{
    
    
    
    return NO;
}

@end
