//
//  InversionCount.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 27/04/21.
//

#import "InversionCount.h"
#import "Utils.h"

@implementation InversionCount

- (int)inversionCount:(NSArray *)arr
{
    int inversions = 0;
    for (int i=0; i<arr.count; i++) {
        for (int j=i+1; j<arr.count; j++) {
            if (![Utils isNumber:arr[i] lessThan:arr[j]]) {
                inversions = inversions + 1;
            }
        }
    }
    return inversions;
}

- (int)merge:(NSArray **)arr low:(int)low mid:(int)mid high:(int)high
{
    NSMutableArray *sort = (*arr).mutableCopy;
    
    int i = low;
    int j = mid+1;
    
    int inversions = 0;
    
    for (int itr=low; itr<=high; itr++) {
    
        if (i>mid) {
            sort[itr] = (*arr)[j];
            j = j+1;
        } else if (j > high) {
            sort[itr] = (*arr)[i];
            i = i+1;
        } else if ([Utils isNumber:(*arr)[i] lessThan:(*arr)[j]]) {
            sort[itr] = (*arr)[i];
            i = i+1;
        } else {
            inversions = inversions + mid + 1 - i;
            sort[itr] = (*arr)[j];
            j = j+1;
        }
        
    }
    
    *arr = sort.copy;
    
    return inversions;
}

- (int)sort:(NSArray **)arr low:(int)low high:(int)high
{
    int inversionCount = 0;
    if (high > low) {
        int mid = low + (high - low)/2;
        inversionCount = [self sort:arr low:low high:mid];
        inversionCount = [self sort:arr low:mid+1 high:high];
        inversionCount = [self merge:arr low:low mid:mid high:high];
    }
    return inversionCount;
}

- (int)inversionCountUsingMS:(NSArray *)arr
{
    int inversions = [self sort:&arr low:0 high:(int)arr.count-1];
    return inversions;
}

@end
