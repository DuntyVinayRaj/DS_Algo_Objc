//
//  PathBetweenNodes.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 08/05/21.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

NS_ASSUME_NONNULL_BEGIN

@interface PathBetweenNodes : NSObject


+ (NSArray *)pathBetweenNode:(int)a andNode:(int)b root:(Tree *)root;

@end

NS_ASSUME_NONNULL_END
