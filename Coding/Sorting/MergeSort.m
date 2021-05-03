//
//  MergeSort.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 27/04/21.
//

#import "MergeSort.h"

@implementation MergeSort


- (void)merge:(NSArray **)arr sortedArr:(NSMutableArray *)sorted low:(int)low high:(int)high mid:(int)mid
{
    int i = low;
    int j = mid+1;
    
    sorted = (*arr).mutableCopy;
    for (int itr=low; itr<=high; itr++) {
        if (i>mid) {
            sorted[itr] = (*arr)[j];
            j = j+1;
        } else if (j>high) {
            sorted[itr] = (*arr)[i];
            i = i+1;
        } else if ( ((NSNumber *)(*arr)[i]).intValue <  ((NSNumber *)(*arr)[j]).intValue ) {
            sorted[itr] = (*arr)[i];
            i = i+1;
        } else {
            sorted[itr] = (*arr)[j];
            j = j+1;
        }
    }
    
    *arr = sorted.copy;
}

- (void)sort:(NSArray **)arr sortedArray:(NSMutableArray *)sorted low:(int)low high:(int)high
{
    if (low >= high) {
        return;
    }
    
    int mid = low + (high - low)/2;
    [self sort:arr sortedArray:sorted low:low high:mid];
    [self sort:arr sortedArray:sorted low:mid+1 high:high];
    [self merge:arr sortedArr:sorted low:low high:high mid:mid];
}

- (NSArray *)sortArray:(NSArray *)inputArray
{
    int low = 0;
    int high = (int)inputArray.count-1;
    NSMutableArray *sorted = NSMutableArray.new;
    [self sort:&inputArray sortedArray:sorted low:low high:high];
    return inputArray;
}
@end
