//
//  GraphProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 09/05/21.
//

#import "GraphProblems.h"
#import "GraphADT.h"
#import "GraphDFS.h"
#import "GraphBFS.h"

@implementation GraphProblems

- (GraphADT *)initializeGraph
{
    GraphADT *graphADT = [[GraphADT alloc] initWithVertices:5];
    [graphADT addEdge:0 toV2:1];
    [graphADT addEdge:0 toV2:2];
    [graphADT addEdge:2 toV2:3];
    [graphADT addEdge:2 toV2:4];
    [graphADT addEdge:2 toV2:0];
    return graphADT;
}

+ (void)graphProblemsMenu
{
    NSInteger choice = 1;
    switch (choice) {
        case 1:
        {
            GraphADT *graph = [[GraphProblems alloc] initializeGraph];
            NSLog(@"%@", [graph dsiplayGraph]);
            
            [GraphDFS DepthFirstPaths:graph source:0];
            [GraphBFS BreadthFirstPaths:graph source:2];
            
            GraphDFS *gDFS = [[GraphDFS alloc] initWithgraph:graph];
            int vertex1 = 2;
            int vertex2 = 3;
            BOOL isConnected = [gDFS isVertex:vertex1 connectedTo:vertex2];
            NSLog(@"Vertex %d is connected to %d ? - %d", vertex1, vertex2, isConnected);
        }
            break;
        case 2:
        {
            GraphADT *graph = [[GraphProblems alloc] initializeGraph];
            GraphDFS *dfs = [[GraphDFS alloc] initWithgraph:graph];
            NSLog(@"DFS cyclic check - %d", [dfs isCyclic:graph source:0]);
        }
            break;
        default:
            break;
    }
}

@end
