//
//  StringInterleaving.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StringInterleaving : NSObject

+ (BOOL)isString:(NSString *)str interleavingOf:(NSString *)firstString andString:(NSString *)secondString;

@end

NS_ASSUME_NONNULL_END
