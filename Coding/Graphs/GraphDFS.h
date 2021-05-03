//
//  GraphDFS.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import <Foundation/Foundation.h>
#import "GraphADT.h"

NS_ASSUME_NONNULL_BEGIN

@interface GraphDFS : NSObject

+ (void)DepthFirstPaths:(GraphADT *)graph source:(int)source;

@end

NS_ASSUME_NONNULL_END
