//
//  Utils.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 26/04/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (BOOL) isPalindrome:(NSString *)string;

+ (BOOL)isNumber:(NSNumber *)n1 lessThan:(NSNumber *)n2;

@end

NS_ASSUME_NONNULL_END
