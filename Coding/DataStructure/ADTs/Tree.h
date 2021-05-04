//
//  Tree.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tree : NSObject
- (instancetype)initWithData:(int)data left:(Tree *)left right:(Tree *)right;
@end

NS_ASSUME_NONNULL_END
