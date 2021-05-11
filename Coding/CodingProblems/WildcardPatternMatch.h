//
//  WildcardPatternMatch.h
//  Coding
//
//  Created by Dunty Vinay Raj  on 10/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WildcardPatternMatch : NSObject

+ (BOOL)isPattern:(NSString *)pattern match:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
