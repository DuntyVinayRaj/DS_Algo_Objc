//
//  MyStack.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 25/04/21.
//

#import "MyStack.h"

/* MAX STACK
 
 Push(x) : Inserts x at the top of stack.

 If stack is empty, insert x into the stack and make maxEle equal to x.
 If stack is not empty, compare x with maxEle. Two cases arise:
 If x is less than or equal to maxEle, simply insert x.
 If x is greater than maxEle, insert (2*x – maxEle) into the stack and make maxEle equal to x. For example, let previous maxEle was 3. Now we want to insert 4. We update maxEle as 4 and insert 2*4 – 3 = 5 into the stack.
 Pop() : Removes an element from top of stack.

 Remove element from top. Let the removed element be y. Two cases arise:
 If y is less than or equal to maxEle, the maximum element in the stack is still maxEle.
 If y is greater than maxEle, the maximum element now becomes (2*maxEle – y), so update (maxEle = 2*maxEle – y). This is where we retrieve previous maximum from current maximum and its value in stack. For example, let the element to be removed be 5 and maxEle be 4. We remove 5 and update maxEle as 2*4 – 5 = 3.
 
 Stack doesn’t hold actual value of an element if it is maximum so far.
 Actual maximum element is always stored in maxEle
 
 */


@interface ListNode : NSObject
@property ListNode *next;
@property id data;
@end

@implementation ListNode
@end

@interface MyStack()
@property ListNode *head;
@end

@implementation MyStack

- (instancetype)init
{
    if (self = [super init]) {
//        self.head = ListNode.new; //[[ListNode alloc] init];
//        self.head.next = nil;
//        self.head.data = nil;
    }
    return self;
}

- (ListNode *)getNode:(id)data
{
    ListNode *node = ListNode.new;
    node.data = data;
    node.next = nil;
    return node;
}

#pragma mark Stack functions
- (void)push:(id)element
{
    if (!element) {
        return;
    }
    
    ListNode *node = [self getNode:element];
    if (!self.head) {
        self.head = node;
        return;
    }
    
    node.next = self.head;
    self.head = node;
}

- (id)pop
{
    ListNode *temp = self.head;
    self.head = self.head.next;
    return temp.data;
}

- (id)top
{
    return self.head.data;
}

- (int)itemCount
{
    int i=0;
    ListNode *node = self.head;
    while (node) {
        i++;
        node = node.next;
    }
    return i;
}
@end
