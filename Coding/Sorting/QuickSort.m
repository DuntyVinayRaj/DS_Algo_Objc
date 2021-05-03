//
//  QuickSort.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 28/04/21.
//

#import "QuickSort.h"
#import "Utils.h"

@implementation QuickSort

- (void)swap:(NSArray **)arr ofIndex:(int)index1 toIndex:(int)index2
{
    NSMutableArray *swapArr = (*arr).mutableCopy;
    NSNumber *temp = swapArr[index1];
    swapArr[index1] = swapArr[index2];
    swapArr[index2] = temp;
    *arr = swapArr.copy;
}

- (int)partiiton:(NSArray **)arr low:(int)low high:(int)high
{
    int partition = low;
    
    int i=low;
    int j=high;
    
    NSNumber *pivot = (*arr)[partition];
    
    while ( true ) {
        while ([Utils isNumber:(*arr)[++i] lessThan:pivot]) {
            if (i >= high-1) {
                break;
            }
        }
        
        while (![Utils isNumber:(*arr)[--j] lessThan:pivot]) {
            if (j <= low) {
                break;
            }
        }
        
        if (i >= j) {
            break;
        }
        
        [self swap:arr ofIndex:i toIndex:j];
    }
    
    [self swap:arr ofIndex:j toIndex:partition];
    
    return j;
}

- (void)sort:(NSArray **)arr low:(int)low high:(int)high
{
    if (low >= high) {
        return;
    }
    
    int partition = [self partiiton:arr low:low high:high];
    [self sort:arr low:low high:partition];
    [self sort:arr low:partition+1 high:high];
}

- (NSArray *)sortArray:(NSArray *)inputArray
{
    [self sort:&inputArray low:0 high:(int)inputArray.count];
    return inputArray;
}

@end
