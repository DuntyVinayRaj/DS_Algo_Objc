//
//  ArrayProblems.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 09/05/21.
//

#import "ArrayProblems.h"
#import "MajorityElement.h"
#import "MergeSort.h"
#import "RearrangePositiveNegative.h"
#import "InversionCount.h"
#import "QuickSort.h"
#import "QuickSelect.h"

@implementation ArrayProblems

+ (void)arrayProblemsMenu
{
    NSInteger choice = 1;
    switch (choice) {
        case 1:
        {
            NSArray *testVal = @[@3, @2, @3];
            int major = [[[MajorityElement alloc] init] majorityElement:testVal];
            NSLog(@"Majority element is - %d", major);
        }
            break;
        case 2:
        {
            NSArray *ip = @[@3, @1, @4, @2];
            ip = [[[MergeSort alloc] init] sortArray:ip];
            NSLog(@"%@", ip);
        }
            break;
        case 3:
        {
            NSArray *ip = @[@12, @11, @-13, @-5, @6, @-7, @5, @-3, @-6]; //@[@1, @-2, @3, @-3, @4, @-1];
            ip = [[[RearrangePositiveNegative alloc] init] rearrangeNumbers:ip];
            NSLog(@"%@", ip);
        }
            break;
        case 4:
        {
            NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
            int count = [[[InversionCount alloc] init] inversionCountUsingMS:ip];
            NSLog(@"%d", count);
        }
            break;
        case 5:
        {
            NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
            ip = [[[QuickSort alloc] init] sortArray:ip];
            NSLog(@"%@", ip);
        }
            break;
        case 6:
        {
            NSArray *ip = @[@8, @4, @2, @1]; //@[@4, @1, @3, @2]; //@[@1, @-2, @3, @-3, @4, @-1];
            int largest = [[[QuickSelect alloc] init] findKth:5 largestInArray:ip];
            NSLog(@"%d", largest);
        }
            break;
        default:
            break;
    }
}



@end
