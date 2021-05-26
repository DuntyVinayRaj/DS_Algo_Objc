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
#import "MaxStack.h"
#import "MaxInSlidingWindow.h"
#import "SmallInSlidingWindow.h"

@implementation ArrayProblems

+ (void)arrayProblemsMenuWithChoice:(int)choice
{
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
        case 7:
        {
            MaxStack *maxStack = [[MaxStack alloc] init];
            [maxStack push:@(3)];
            NSLog(@"Max element is %@", maxStack.maxElement);
            
            [maxStack push:@(7)];
            NSLog(@"Max element is %@", maxStack.maxElement);
            
            [maxStack pop];
            NSLog(@"Max element is %@", maxStack.maxElement);
        }
            break;
        case 8:
        {
            NSArray *ipArray = @[@8, @7, @6, @5, @4, @3];
            int windowSize = 3;
            NSArray *result = [MaxInSlidingWindow findMaxElementsIn:ipArray ofWindow:windowSize];
            NSLog(@"Max are %@", result);
        }
            break;
        case 9:
        {
            NSArray *ipArray = @[@0, @3, @4, @5, @6, @7];
            int windowSize = 3;
            NSArray *result = [SmallInSlidingWindow findMinElementsIn:ipArray ofWindow:windowSize];
            NSLog(@"Min are %@", result);
        }
            break;
        default:
            break;
    }
}



@end
