//
//  GraphBFS.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 03/05/21.
//

#import <Foundation/Foundation.h>
#import "GraphADT.h"

NS_ASSUME_NONNULL_BEGIN

@interface GraphBFS : NSObject

+ (void)BreadthFirstPaths:(GraphADT *)graph source:(int)source;

@end

NS_ASSUME_NONNULL_END
