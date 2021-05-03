//
//  BST.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 30/04/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSTNode : NSObject
@property int data;
@property BSTNode *left;
@property BSTNode *right;
- (instancetype)initWithData:(int)data left:(BSTNode *_Nullable)left right:(BSTNode *_Nullable)right;
@end

@interface BST : NSObject
- (instancetype)initWithRoot:(BSTNode *)root;
- (int)findSmallestElementInBST;
- (BSTNode *)insertNode:(int)key;
+ (BOOL) isLevelOrderBST:(NSArray *)keys;
@end

NS_ASSUME_NONNULL_END
