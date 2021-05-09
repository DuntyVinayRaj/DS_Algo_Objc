//
//  ExpressionEvaluation.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 25/04/21.
//

#import "ExpressionEvaluation.h"
#import "MyStack.h"

@implementation ExpressionEvaluation

- (BOOL)evaluateExpression:(NSString *)expression
{
    MyStack *valueStack = MyStack.new;
    MyStack *operatorStack = MyStack.new;
    
    int i=0;
    while (i < expression.length) {
        
        unichar charAtIndex = [expression characterAtIndex:i];
        NSCharacterSet *numericSet = [NSCharacterSet decimalDigitCharacterSet];
        
        if ([numericSet characterIsMember:charAtIndex]) {
            // Number
            [valueStack push: [NSString stringWithFormat:@"%c", charAtIndex]];
        } else if (charAtIndex == ')') {
            
            // Get top 2 from value stack
            int value1 = ((NSString *)[valueStack pop]).intValue;
            int value2 = ((NSString *)[valueStack pop]).intValue;
            
            NSString *op = (NSString *)[operatorStack pop];
            
            if ([op isEqualToString:@"+"]) {
                [valueStack push:[NSString stringWithFormat:@"%d", value1 + value2]];
            } else if ([op isEqualToString:@"-"]) {
                [valueStack push:[NSString stringWithFormat:@"%d", value1 - value2]];
            } else if ([op isEqualToString:@"*"]) {
                [valueStack push:[NSString stringWithFormat:@"%d", value1 * value2]];
            } else if ([op isEqualToString:@"/"]) {
                [valueStack push:[NSString stringWithFormat:@"%d", value1 / value2]];
            } else {
                NSLog(@"Invalid operation");
            }
            
            
        } else if (charAtIndex == '(') {
            // No op
        } else {
            // Operator
            [operatorStack push:[NSString stringWithFormat:@"%c", charAtIndex]];
        }
        
        i++;
    }
    
    
    NSLog(@"The expression value is - %d", ((NSString *)[valueStack pop]).intValue);
    
    return NO;
}

@end
