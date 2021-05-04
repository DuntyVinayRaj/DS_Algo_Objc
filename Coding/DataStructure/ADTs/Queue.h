//
//  Queue.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

- (void)enqueue:(int)vertex;
- (int)dequeue;
- (NSArray *)itemsInQueue;
- (NSInteger)itemCount;

@end

NS_ASSUME_NONNULL_END
