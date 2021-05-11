//
//  DPFibonacci.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 11/05/21.
//

#import "DPFibonacci.h"

@implementation DPFibonacci

+ (int)getFibonacci:(int)n
{
    int arr[n+2];
    
    arr[0] = 0;
    arr[1] = 1;
    
    for (int i=2; i<n+2; i++) {
        arr[i] = arr[i-1] + arr[i-2];
    }
    
    return arr[n];
}

@end
