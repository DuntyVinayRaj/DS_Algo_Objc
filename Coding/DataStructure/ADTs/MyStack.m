//
//  MyStack.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 25/04/21.
//

#import "MyStack.h"

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
