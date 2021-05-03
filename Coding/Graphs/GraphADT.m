//
//  GraphADT.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import "GraphADT.h"

@interface AdjacencyList: NSObject

@property NSMutableArray *adjVetices;
- (void)addEdgeTo:(int)vertex;
- (NSArray<NSNumber *> *)verticesInAdjacencyList;

@end

@implementation AdjacencyList

- (void)addEdgeTo:(int)vertex
{
    if (!self.adjVetices) {
        self.adjVetices = NSMutableArray.new;
    }
    [self.adjVetices addObject:@(vertex)];
}

- (NSArray<NSNumber *> *)verticesInAdjacencyList;
{
    return self.adjVetices;
}

@end

@interface GraphADT()
@property int V;
@property NSArray <AdjacencyList *> *adjList;
@end

@implementation GraphADT

- (instancetype)initWithVertices:(int) V
{
    if (self = [super init]) {
        _V = V;
        NSMutableArray *adjacencyList = NSMutableArray.new;
        for (int i=0; i<V; i++) {
            adjacencyList[i] = [[AdjacencyList alloc] init];
        }
        _adjList = adjacencyList.copy;
    }
    return self;
}

#pragma mark Graph Interface methods

- (void)addEdge:(int)v1 toV2:(int)v2
{
    NSMutableArray *adjList = [self.adjList mutableCopy];

    AdjacencyList *listV1 = adjList[v1];
    [listV1 addEdgeTo:v2];
    adjList[v1] = listV1;
    
    AdjacencyList *listV2 = adjList[v2];
    [listV2 addEdgeTo:v1];
    adjList[v2] = listV2;
    
    self.adjList = adjList.copy;
}


- (NSInteger)vertices
{
    return self.V;
}

- (NSInteger)edges
{
    return 1;
}

- (NSArray<NSNumber *> *)adjacentVerticesToVetex:(int)vertex
{
    AdjacencyList *list = self.adjList[vertex];
    return list.adjVetices;
}

- (NSString *)dsiplayGraph
{
    NSString *graphs = @"";
    int i=0;
    for (AdjacencyList *list in self.adjList) {
        for (NSNumber *vertex in list.adjVetices) {
            NSString *edge = [NSString stringWithFormat:@"%d - %@\n", i, vertex];
            graphs = [graphs stringByAppendingString: edge];
        }
        i++;
    }
    return graphs;
}

@end
