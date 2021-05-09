//
//  Tree.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tree : NSObject
- (instancetype)initWithData:(int)data left:(Tree *_Nullable)left right:(Tree *_Nullable)right;
- (void)addLeftNode:(Tree *)left;
- (void)addRightNode:(Tree *)right;
- (int)getNodeData;
- (Tree *)getLeftNode;
- (Tree *)getRightNode;
- (int)getLevelOfNode:(Tree *)head;

@end

NS_ASSUME_NONNULL_END
