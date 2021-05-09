//
//  Queue.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

- (void)enqueueInt:(int)item;
- (void)enqueueObject:(id)object;

- (int)dequeueInt;
- (id)dequeueObject;

- (NSArray *)itemsInQueue;
- (NSInteger)itemCount;

@end

NS_ASSUME_NONNULL_END
