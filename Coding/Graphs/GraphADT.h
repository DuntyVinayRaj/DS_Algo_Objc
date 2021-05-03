//
//  GraphADT.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GraphADT : NSObject

- (instancetype)initWithVertices:(int) V;
- (void)addEdge:(int)v1 toV2:(int)v2;
- (NSInteger)vertices;
- (NSInteger)edges;
- (NSArray<NSNumber *> *)adjacentVerticesToVetex:(int)vertex;
- (NSString *)dsiplayGraph;

@end

NS_ASSUME_NONNULL_END
