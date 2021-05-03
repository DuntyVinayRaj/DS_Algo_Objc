//
//  PriorityQueue.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 29/04/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PriorityQueue : NSObject

- (void)insertElement:(int)element;
- (void)deleteMax;
- (int)sizeOfElements;
- (int)maxElement;
- (BOOL)isEmpty;
- (void)display;

@end

NS_ASSUME_NONNULL_END
