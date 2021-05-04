//
//  QuickSelect.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 28/04/21.
//

#import "QuickSelect.h"
#import "Utils.h"

@implementation QuickSelect

- (void)swap:(NSArray **)arr atIndex:(int)index1 toIndex:(int)index2
{
    NSMutableArray *swap = (*arr).mutableCopy;
    swap[index1] = swap[index2];
    swap[index2] = (*arr)[index1];
    *arr = swap.copy;
}

- (int)partition:(NSArray **)arr low:(int)low high:(int)high
{
    int partition = low;
    NSNumber *pivot = (*arr)[partition];
    
    int i = low;
    int j = high;
    
    while (true) {
     
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
        
        [self swap:arr atIndex:j toIndex:i];
    }
    
    [self swap:arr atIndex:partition toIndex:j];
    return j;
}

- (int)sort:(NSArray **)arr low:(int)low high:(int)high k:(int)k
{
    int partition = [self partition:arr low:low high:high];
    
    if (partition == k) {
        return partition;
    }
    
    if (k > partition) {
        partition = [self sort:arr low:partition+1 high:high k:k];
    } else if (k < partition) {
        partition = [self sort:arr low:low high:partition k:k];
    }

    return partition;
}

- (int)findKth:(int)k largestInArray:(NSArray *)arr
{
    if (k > arr.count) {
        return -1;
    }
    
    int postion = ((int)arr.count - k);
    int elementIndex = [self sort:&arr low:0 high:(int)arr.count k:postion];
    return( (NSNumber *)arr[elementIndex]).intValue;
}

@end
